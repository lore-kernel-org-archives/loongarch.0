Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20FA19B
	for <loongarch@lists.linux.dev>; Fri, 24 Mar 2023 16:33:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2C3A113E;
	Fri, 24 Mar 2023 09:34:38 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.56.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17CBD3F6C4;
	Fri, 24 Mar 2023 09:33:52 -0700 (PDT)
Date: Fri, 24 Mar 2023 16:32:52 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg()
 fallbacks
Message-ID: <ZB3QtDYuWdpiD5qk@FVFF77S0Q05N>
References: <20230305205628.27385-1-ubizjak@gmail.com>
 <20230305205628.27385-2-ubizjak@gmail.com>
 <ZB2v+avNt52ac/+w@FVFF77S0Q05N>
 <CAFULd4ZCgxDYnyy--qdgKoAo_y7MbNSaQdbdBFefnFuMoM2OYw@mail.gmail.com>
 <ZB3MR8lGbnea9ui6@FVFF77S0Q05N>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZB3MR8lGbnea9ui6@FVFF77S0Q05N>

On Fri, Mar 24, 2023 at 04:14:22PM +0000, Mark Rutland wrote:
> On Fri, Mar 24, 2023 at 04:43:32PM +0100, Uros Bizjak wrote:
> > On Fri, Mar 24, 2023 at 3:13 PM Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote:
> > > > Cast _oldp to the type of _ptr to avoid incompatible-pointer-types warning.
> > >
> > > Can you give an example of where we are passing an incompatible pointer?
> > 
> > An example is patch 10/10 from the series, which will fail without
> > this fix when fallback code is used. We have:
> > 
> > -       } while (local_cmpxchg(&rb->head, offset, head) != offset);
> > +       } while (!local_try_cmpxchg(&rb->head, &offset, head));
> > 
> > where rb->head is defined as:
> > 
> > typedef struct {
> >    atomic_long_t a;
> > } local_t;
> > 
> > while offset is defined as 'unsigned long'.
> 
> Ok, but that's because we're doing the wrong thing to start with.
> 
> Since local_t is defined in terms of atomic_long_t, we should define the
> generic local_try_cmpxchg() in terms of atomic_long_try_cmpxchg(). We'll still
> have a mismatch between 'long *' and 'unsigned long *', but then we can fix
> that in the callsite:
> 
> 	while (!local_try_cmpxchg(&rb->head, &(long *)offset, head))

Sorry, that should be:
	
	while (!local_try_cmpxchg(&rb->head, (long *)&offset, head))

The fundamenalthing I'm trying to say is that the
atomic/atomic64/atomic_long/local/local64 APIs should be type-safe, and for
their try_cmpxchg() implementations, the type signature should be:

	${atomictype}_try_cmpxchg(${atomictype} *ptr, ${inttype} *old, ${inttype} new)

Thanks,
Mark.
