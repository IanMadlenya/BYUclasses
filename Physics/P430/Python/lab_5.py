"""
Created Jan 30, 2013

Author: Spencer Lyon

Lab 5 for Physics 430
"""
from __future__ import division
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from tools import make_grid
import matplotlib.animation as manimation

plt.ion()


def p5_3(part=None):
    """
    Complete solution to problem 5_3

    Parameters
    ----------
    part: str, optional(default=None)
        The part number you would like evaluated. If this is left blank
        the default value of None is used and the entire problem will be
        solved.

    Returns
    -------
    i-dont-know-yet
    """
    if not part:
        part = 'a'

    # Initialize the animation writer
    FFMpegWriter = manimation.writers['ffmpeg']
    metadata = dict(title='P430 5.3' + part, artist='Spencer Lyon')
    writer = FFMpegWriter(fps=15, metadata=metadata)

    # Set the values for parameters
    c = 2  # wave speed

    # build a cell-centered grid with N=200 cells
    # on the interval x=0 to x=L, with L=1
    L = 1  # Left boundary
    n = 200  # Number of cells
    x, h = make_grid(0, L, n, grid_type='cell_center_ghost')
    j = np.arange(1, n + 1)

    # define the initial displacement and velocity vs. x
    y = np.exp(- (x - L / 2) ** 2 * 160 / L ** 2) - \
        np.exp(- (0 - L / 2) ** 2 * 160 / L ** 2)
    vy = np.zeros_like(x)

    if part == 'c':
        y = np.zeros_like(x)
        vy = np.exp(- (x - L / 2) ** 2 * 160 / L ** 2) - \
        np.exp(- (0 - L / 2) ** 2 * 160 / L ** 2)

    # Choose a time step (Suggest that it is no larger than taulim)
    taulim = h / c
    print 'Courant time step limit %f \n' % (taulim)
    tau = float(raw_input('Enter the time step: '))

    # Get the initial value of y_old from the initial y and vy
    y_old = np.zeros_like(y)
    y_old[j] = y[j] - tau * vy[j] + c ** 2 * tau ** 2 / (2 * h ** 2) * \
            (y[j + 1] - 2 * y[j] + y[j - 1])

    # Apply the boundary conditions for y_old(1) and y_old(N+2)
    y_old[0] = 0
    y_old[-1] = 0

    # plot the initial conditions and pause to look at them
    plt.ion()
    plt.figure()
    plt.subplot(211)
    plt.plot(x, y)
    plt.xlabel('x')
    plt.ylabel('y(x,0)')
    plt.title('Initial Displacement')
    plt.subplot(212)
    plt.plot(x, vy)
    plt.xlabel('x')
    plt.ylabel('v_y(x,0)')
    plt.title('Initial Velocity')
    plt.draw()
    plt.ioff()

    # Choose how long to run and when to plot
    tfinal = float(raw_input(' Enter tfinal (2 seconds is plenty): '))
    skip = float(raw_input(' Enter # of steps to skip between plots' +  \
                 '(1-5 is good):'))
    nsteps = int(tfinal / tau)

    # here is the loop that steps the solution along

    fig = plt.figure()
    l, = plt.plot([], [], 'b-')
    if part != 'c':
        plt.axis([x.min(), x.max(), -2, 2])
    else:
        plt.axis([x.min(), x.max(), -0.04, 0.04])

    with writer.saving(fig, "p5_3" + part + ".mp4", 200):
        for n in range(nsteps):
            time = n * tau  # compute the time

            # Use leapfrog and the boundary conditions to load y_new with y
            # at the next time step using y and y_old, i.e., y_new(2:N+1)=...
            # Be sure to use colon commands so it will run fast.
            ynew = np.zeros_like(y)
            ynew[j] = 2 * y[j] - y_old[j] + c ** 2 * tau ** 2 / (h ** 2) * \
                    (y[j + 1] - 2 * y[j] + y[j - 1])

            if part == 'b':
                ynew[0] = ynew[1]
                ynew[-1] = ynew[-2]

            #update y_old and y
            y_old = y
            y = ynew

        # make plots every skip time steps
            if n % skip == 0:
                print 'On step %i of %i' % (n, nsteps)
                l.set_data(x, y)
                plt.title('Staggered Leapfrog Wave: time %.2e' % time)
                writer.grab_frame()
                # plt.plot(x, y, 'b-')
                # plt.xlabel('x')
                # plt.ylabel('y')
                # plt.title('Staggered Leapfrog Wave: time %.2e' % time)
                # plt.axis([x.min(), x.max(), -2, 2])
                # if part == 'c':
                #     plt.axis([x.min(), x.max(), -0.04, 0.04])
                # plt.draw()
                # raw_input('Press any key to continue')


def p5_4(part=None):
    """
    Complete solution to problem 5.4

    Parameters
    ----------
    part: str, optional(default=None)
        The part number you would like evaluated. If this is left blank
        the default value of None is used and the entire problem will be
        solved.

    Returns
    -------
    i-dont-know-yet
    """
    # Initialize the animation writer
    FFMpegWriter = manimation.writers['ffmpeg']
    metadata = dict(title='P430 5.4', artist='Spencer Lyon')
    writer = FFMpegWriter(fps=15, metadata=metadata)

    # Set the values for parameters
    c = 2  # wave speed
    gamma = 0.2

    # build a cell-centered grid with N=200 cells
    # on the interval x=0 to x=L, with L=1
    L = 1  # Left boundary
    n = 200  # Number of cells
    x, h = make_grid(0, L, n, grid_type='cell_center_ghost')
    j = np.arange(1, n + 1)

    # define the initial displacement and velocity vs. x
    y = np.zeros_like(x)
    vy = np.exp(- (x - L / 2) ** 2 * 160 / L ** 2) - \
    np.exp(- (0 - L / 2) ** 2 * 160 / L ** 2)

    # Choose a time step (Suggest that it is no larger than taulim)
    taulim = h / c
    print 'Courant time step limit %f \n' % (taulim)
    tau = float(raw_input('Enter the time step: '))

    # Get the initial value of yold from the initial y and vy
    y_old = np.zeros_like(y)
    y_old[j] = (1 / (2 * h ** 2)) * (
                (c * tau) ** 2 * (y[j - 1] - 2 * y[j] + y[j + 1]) +
                h ** 2 * (2 * y[j] - tau * vy[j] * (gamma * tau + 2)))

    # Apply the boundary conditions for yold(1) and yold(N+2)
    y_old[0] = 0
    y_old[-1] = 0

    # plot the initial conditions and pause to look at them
    plt.ion()
    plt.figure()
    plt.subplot(211)
    plt.plot(x, y)
    plt.xlabel('x')
    plt.ylabel('y(x,0)')
    plt.title('Initial Displacement')
    plt.subplot(212)
    plt.plot(x, vy)
    plt.xlabel('x')
    plt.ylabel('v_y(x,0)')
    plt.title('Initial Velocity')
    plt.show()
    plt.draw()
    plt.ioff()

    # Choose how long to run and when to plot
    tfinal = float(raw_input(' Enter tfinal:'))
    skip = float(raw_input(' Enter # of steps to skip between plots (faster):'))
    nsteps = int(tfinal / tau)

    # here is the loop that steps the solution along

    fig = plt.figure()
    l, = plt.plot([], [], 'b-')
    plt.axis([x.min(), x.max(), -0.04, 0.04])
    max_y = np.zeros(nsteps)
    times = np.linspace(0, 25, nsteps)

    with writer.saving(fig, "p5_4c.mp4", 200):
        for n in range(nsteps):
            time = times[n]  # compute the time

            # Use leapfrog and the boundary conditions to load y_new with y
            # at the next time step using y and y_old, i.e., y_new(2:N+1)=...
            # Be sure to use colon commands so it will run fast.
            ynew = np.zeros_like(y)
            ynew[j] = (1 / (2 + gamma * tau)) * (
                       4 * y[j] - 2 * y_old[j] + gamma * tau * y_old[j] +
                       (2 * (c * tau) ** 2 / (h ** 2)) * (y[j + 1] - 2 * y[j] + y[j - 1]))

            #update y_old and y
            y_old = y
            y = ynew
            max_y[n] = y.max()

        # make plots every skip time steps
            if n % skip == 0:
                print 'On step %i of %i' % (n, nsteps)
                l.set_data(x, y)
                plt.title('Staggered Leapfrog Wave: time %.2e' % time)
                writer.grab_frame()
                # plt.plot(x, y, 'b-')
                # plt.xlabel('x')
                # plt.ylabel('y')
                # plt.title('Staggered Leapfrog Wave: time %.2e' % time)
                # plt.axis([x.min(), x.max(), -2, 2])
                # if part == 'c':
                #     plt.axis([x.min(), x.max(), -0.04, 0.04])
                # plt.draw()
                # raw_input('Press any key to continue')
                # pause(.1)  # TODO: figure out how to use this

    plt.figure()
    plt.plot(times, max_y, 'b-')
    plt.plot(times, 0.035 * np.exp(-gamma * times / 2), 'r-')
    plt.title('Max Amplitude vs. time')


def p5_5(part=None):
    """
    Complete solution to problem 5.5

    Parameters
    ----------
    part: str, optional(default=None)
        The part number you would like evaluated. If this is left blank
        the default value of None is used and the entire problem will be
        solved.

    Returns
    -------
    i-dont-know-yet
    """
    FFMpegWriter = manimation.writers['ffmpeg']
    metadata = dict(title='P430 5.5', artist='Spencer Lyon')
    writer = FFMpegWriter(fps=15, metadata=metadata)

    # Set the values for parameters
    T = 127
    mu = 0.003
    L = 1.2
    c = np.sqrt(T / mu)  # wave speed
    omega = 400
    gamma = 0.2

    # build a cell-centered grid with N=200 cells
    # on the interval x=0 to x=L, with L=1
    n = 200  # Number of cells
    x, h = make_grid(0, L, n, grid_type='cell_center_ghost')
    f = np.zeros_like(x)
    f[x >= 0.8] = 0.73
    f[x <= 1] = 0
    j = np.arange(1, n + 1)

    # define the initial displacement and velocity vs. x
    y = np.zeros_like(x)
    vy = np.exp(- (x - L / 2) ** 2 * 160 / L ** 2) - \
    np.exp(- (0 - L / 2) ** 2 * 160 / L ** 2)

    # Choose a time step (Suggest that it is no larger than taulim)
    taulim = h / c
    print 'Courant time step limit %f \n' % (taulim)
    tau = float(raw_input('Enter the time step: '))

    # Get the initial value of yold from the initial y and vy
    y_old = np.zeros_like(y)

    # plot the initial conditions and pause to look at them
    plt.ion()
    plt.figure()
    plt.subplot(211)
    plt.plot(x, y)
    plt.xlabel('x')
    plt.ylabel('y(x,0)')
    plt.title('Initial Displacement')
    plt.subplot(212)
    plt.plot(x, vy)
    plt.xlabel('x')
    plt.ylabel('v_y(x,0)')
    plt.title('Initial Velocity')
    plt.draw()
    plt.ioff()

    # Choose how long to run and when to plot
    tfinal = float(raw_input(' Enter tfinal:'))
    skip = float(raw_input(' Enter # of steps to skip between plots (faster):'))
    nsteps = int(tfinal // tau)

    # here is the loop that steps the solution along
    max_y = np.zeros(nsteps)
    times = np.linspace(0, tfinal, nsteps)

    # Get plot environment ready
    fig = plt.figure()  # TODO: use plt.animate here
    l, = plt.plot([], [], 'b-')
    plt.axis([x.min(), x.max(), -0.001, 0.001])
    with writer.saving(fig, "p5_5_omega" + str(omega) + ".mp4", 200):
        for n in xrange(nsteps):
            time = times[n]  # compute the time

            # Use leapfrog and the boundary conditions to load y_new with y
            # at the next time step using y and y_old, i.e., y_new(2:N+1)=...
            # Be sure to use colon commands so it will run fast.
            ynew = np.zeros_like(y)

            # ynew[j] = (4 * y[j] - 2 * y_old[j]) / (2 + gamma * tau) + \
            #           gamma * tau * y_old[j] / (2 + gamma * tau) + \
            #           2 * c ** 2 * tau ** 2 / h ** 2 / (2 + gamma * tau) * \
            #           (y[j + 1] - 2 * y[j] + y[j - 1]) + f[j] * tau ** 2 / mu / \
            #           (1 + gamma * tau / 2) * np.cos(omega * time)

            ynew[j] = (1 / (h ** 2 * mu * (gamma * tau + 2))) * (
                      mu * (2 * (c * tau) ** 2 * (y[j - 1] - 2 * y[j] + y[j + 1]) +
                            h ** 2 * (4 * y[j] + gamma * tau * y_old[j] - 2 * y_old[j]))
                      + 2 * f[j] * (h * tau) ** 2 * np.cos(time * omega))

            ynew[0] = -ynew[1]
            ynew[-1] = -ynew[-2]

            #update y_old and y
            y_old = y
            y = ynew
            max_y[n] = np.abs(y).max()

        # make plots every skip time steps
            if n % skip == 0:
                l.set_data(x, y)
                plt.title('Staggered Leapfrog Wave: time %.2e' % time)
                writer.grab_frame()
                # plt.plot(x, y, 'b-')
                # plt.xlabel('x')
                # plt.ylabel('y')
                # plt.title('Staggered Leapfrog Wave: time %.2e' % time)
                # plt.axis([x.min(), x.max(), -0.4, 0.4])
                # plt.draw()
                # raw_input('Press any key to continue')
                # pause(.1)  # TODO: figure out how to use this

            if n % (10 * skip) == 0:
                print 'On step %i of %i' % (n, nsteps)

    plt.figure()
    plt.plot(times, max_y, 'b-')
    plt.plot(times, 0.035 * np.exp(-gamma * times / 2), 'r-')
    plt.title('Max Amplitude vs. time')


def main():
    """ Run all problems in this Lab """
    p5_3('a')
    p5_3('b')
    p5_3('c')
    p5_4()
    p5_5()
