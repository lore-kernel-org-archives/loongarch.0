Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0BDA21
	for <loongarch@lists.linux.dev>; Thu,  6 Apr 2023 08:38:55 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id z4so72016qkz.12
        for <loongarch@lists.linux.dev>; Thu, 06 Apr 2023 01:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680770335; x=1683362335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlaEdqHEUWRBg+c+TC3rtvHvp43Ws6SzpzXrskt0NuQ=;
        b=FcEFN1D0ri75uBu6r0ZHhcejyvqKNx6oJ/kCWbsPjgbRTXUK+5sFyIyJ41szjzh2vz
         xVhDHcBOXBBaBl2763I8yyGNI4Y1fwMQfazSTTslgohL9KsMOTUPXNHmYVexNch0+1d0
         Uq60kWvODRXwWd5fupV+fGBAPS0e5NQtrRQ18m1KgxMA+htmCUOAemJHSj13GyKNBBwP
         LnTUsXPtIhkrA3+iVp9wttq9oZ6eterHG0fTb3sDXzAZV2onLK9uY4a0ZVJ4Q0/1Ldd7
         h/usCfUZRrxzV7W5BNMQNSXEN2Am7bp6nL8tc/66t7LSwmSuBBvt43oRFVcj6mjWFab7
         P2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770335; x=1683362335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlaEdqHEUWRBg+c+TC3rtvHvp43Ws6SzpzXrskt0NuQ=;
        b=b/ed24lQDjM5dGJKNXK3oZfq7IRkrKUKazCaY6nON5xBQR4tXYjvyCsyUeCeWA3qNs
         xNq6Ylpr0SgHGIH4kltLPMbzNGbyDTWbS3wzqgO/ikSXbo3HbgT4svgTsXlJTSWux+Ea
         XTum+0gSGLNy83Tj5fp4I4m7D5mAB3iNF8ugItRy1zUX8Gkfq6wDrqgu3ZlNjrw06HOW
         b5TcxkbyTTuDy+tGFsW3B5TUClFJolTHNBY1TthOFgfXIpjSDqT3DSbsvUt33DCy0T+n
         LHfOG8gMCE4Et4AM8TlOsnv7907nO9zZti5tCewP0BQTDvo27jzZAWoT2ykvw3kP7eHa
         3zlw==
X-Gm-Message-State: AAQBX9dkyQJY5vUJUf8z5oDvp04Ix8unQ6frdM2a9tOuE8kGbmDgEpWc
	SXikrgGhEPESqwEyHl3Rc8EABvoaH1oTYAUvhQI=
X-Google-Smtp-Source: AKy350YwsvugLcxPSe8VSwbY+2C98qYCdXwWk5K70J+qErUm4ut29wpYfoU3MlskEoJeNSNDzBP/SXVDE5xtKbu7RqE=
X-Received: by 2002:a05:620a:1a28:b0:742:71e6:b8d4 with SMTP id
 bk40-20020a05620a1a2800b0074271e6b8d4mr2043793qkb.6.1680770334780; Thu, 06
 Apr 2023 01:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230405141710.3551-1-ubizjak@gmail.com> <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
In-Reply-To: <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 6 Apr 2023 10:38:43 +0200
Message-ID: <CAFULd4YPM18B6Nv=-rNd=D0TmCbn64oLvgbDJ3CWc9DsdJG8gg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
To: David Laight <David.Laight@aculab.com>
Cc: Dave Hansen <dave.hansen@intel.com>, 
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "x86@kernel.org" <x86@kernel.org>, 
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jun Yi <yijun@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 6, 2023 at 10:26=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Dave Hansen
> > Sent: 05 April 2023 17:37
> >
> > On 4/5/23 07:17, Uros Bizjak wrote:
> > > Add generic and target specific support for local{,64}_try_cmpxchg
> > > and wire up support for all targets that use local_t infrastructure.
> >
> > I feel like I'm missing some context.
> >
> > What are the actual end user visible effects of this series?  Is there =
a
> > measurable decrease in perf overhead?  Why go to all this trouble for
> > perf?  Who else will use local_try_cmpxchg()?
>
> I'm assuming the local_xxx operations only have to be save wrt interrupts=
?
> On x86 it is possible that an alternate instruction sequence
> that doesn't use a locked instruction may actually be faster!

Please note that "local" functions do not use lock prefix. Only atomic
properties of cmpxchg instruction are exploited since it only needs to
be safe wrt interrupts.

Uros.

> Although, maybe, any kind of locked cmpxchg just needs to ensure
> the cache line isn't 'stolen', so apart from possible slight
> delays on another cpu that gets a cache miss for the line in
> all makes little difference.
> The cache line miss costs a lot anyway, line bouncing more
> and is best avoided.
> So is there actually much of a benefit at all?
>
> Clearly the try_cmpxchg help - but that is a different issue.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1=
 1PT, UK
> Registration No: 1397386 (Wales)
