Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D839634545
	for <loongarch@lists.linux.dev>; Sun, 27 Oct 2024 08:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730016895; cv=none; b=hVaNU7tKz0mUlan/b1Gtxbl8oZTfz0IEYs7n+USBgtm3ZjGv7tqx32JzzB5KEmEyZeXN6+R/wtysYKwhgazFOBrDOJ0PUHKPw3iojcWJH/UL/8yUVCwNjt5r0kVtEATQfHqRXB57k67I0ONWA74bwJL1t1L1ZTFdj9PzmnIwvIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730016895; c=relaxed/simple;
	bh=qSAev/CmbF0LEyj0tVSWN8qmCbJsiIZdku/WjaNmB8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KogwSvOFQJNfDQqkaLa76aVoVOI7/Yq147+DBI/wdnWcMDflWzaNpP28PjkkfFQOCSbs0B1G+dtZpJSppUZP/EOMTNSVzFUbWeQt17O6+AHSnBJnXZWbjBDhXxdOZlAADHxznJbW2LM7LyUSyGAa2PYP8kBpCsTynOIFIiWxGIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZrpP4MR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZrpP4MR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66023C4CEE7
	for <loongarch@lists.linux.dev>; Sun, 27 Oct 2024 08:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730016895;
	bh=qSAev/CmbF0LEyj0tVSWN8qmCbJsiIZdku/WjaNmB8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MZrpP4MR25ZJQaUjkXbWvdc5yqspOvJPpoP1laWGfu5qW0Bo5w7+sOKkNN0wFTFc6
	 PKiAnBHnQLbmymCc6Ix2g32z3lrMLVbYBDbKHRK7wTcnhc0s7TmExnWPBavGFZA2CU
	 ZxRZ2yQKLbZi954nmodxa3gz2r2765XCY13DTcc/5moZEI1Y5VMl2qOE1/CaCzYfBZ
	 d0xolS/t0CNAWzjdhJc8/vC18yj/tzng9oiNhW1i1/DM5wimZSMibZgTJJr4RQf+Mz
	 txNna8i6XM73z7TsjE2DyvvJtyQZu6VY2mWd8g1ZuHlsQxirw+6OUnQuLNMsd9yjTi
	 Vo6meRtf3emmg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so32592121fa.1
        for <loongarch@lists.linux.dev>; Sun, 27 Oct 2024 01:14:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhCcEGiArRpzNgLq88B4/7Vu8V2yB+Le1DkjJgP1MC7g0xrwxdGX4D9J45jSSIDu7D8nvX8RRiKL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDt5r/LS69tB3/DDp+u0qQdIVJ8Jt7z5dS6rvsGWOkFVhcZ4Me
	PjGehsxhkWsxFcPkfmgbecUEtSysVkfIt7COy+IxUY5akFWaZgZVtULSYpmei13ev9cnPpJDmI9
	GrUFPdCRjNpri8AZZl4MR/HyR8uU=
X-Google-Smtp-Source: AGHT+IG7GbUAQTdcFb1Y8OjbqKjN3ralEO/b0dHGyoLDxr37yV7KwVs1ozIjCmGYYGFlqbwOihVt3NM/p1aqclI347g=
X-Received: by 2002:a2e:be9a:0:b0:2fb:58c0:de5b with SMTP id
 38308e7fff4ca-2fcbdfb098emr13787941fa.11.1730016893642; Sun, 27 Oct 2024
 01:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-5-ebiggers@kernel.org>
 <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
 <20241025220239.GB2637569@google.com> <20241026040958.GA34351@sol.localdomain>
In-Reply-To: <20241026040958.GA34351@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 27 Oct 2024 09:14:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
Message-ID: <CAMj1kXGGDNmPSH4nZH4r6b4UyrPEYBbTZibjXkmxU9c=16_hhw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Oct 2024 at 06:10, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Oct 25, 2024 at 10:02:39PM +0000, Eric Biggers wrote:
> > On Fri, Oct 25, 2024 at 10:47:15PM +0200, Ard Biesheuvel wrote:
> > > On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > From: Eric Biggers <ebiggers@google.com>
> > > >
> > > > Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> > > > the arch-specific code was built, only register them when that code was
> > > > built *and* is not falling back to the base implementation at runtime.
> > > >
> > > > This avoids confusing users like btrfs which checks the shash driver
> > > > name to determine whether it is crc32c-generic.
> > > >
> > >
> > > I think we agree that 'generic' specifically means a C implementation
> > > that is identical across all architectures, which is why I updated my
> > > patch to export -arch instead of wrapping the C code in yet another
> > > driver just for the fuzzing tests.
> > >
> > > So why is this a problem? If no optimizations are available at
> > > runtime, crc32-arch and crc32-generic are interchangeable, and so it
> > > shouldn't matter whether you use one or the other.
> > >
> > > You can infer from the driver name whether the C code is being used,
> > > not whether or not the implementation is 'fast', and the btrfs hack is
> > > already broken on arm64.
> > >
> > > > (It would also make sense to change btrfs to test the crc32_optimization
> > > > flags itself, so that it doesn't have to use the weird hack of parsing
> > > > the driver name.  This change still makes sense either way though.)
> > > >
> > >
> > > Indeed. That hack is very dubious and I'd be inclined just to ignore
> > > this. On x86 and arm64, it shouldn't make a difference, given that
> > > crc32-arch will be 'fast' in the vast majority of cases. On other
> > > architectures, btrfs may use the C implementation while assuming it is
> > > something faster, and if anyone actually notices the difference, we
> > > can work with the btrfs devs to do something more sensible here.
> >
> > Yes, we probably could get away without this.  It's never really been
> > appropriate to use the crypto driver names for anything important.  And btrfs
> > probably should just assume CRC32C == fast unconditionally, like what it does
> > with xxHash64, or even do a quick benchmark to measure the actual speed of its
> > hash algorithm (which can also be sha256 or blake2b which can be very fast too).
> >
> > Besides the btrfs case, my concern was there may be advice floating around about
> > checking /proc/crypto to check what optimized code is being used.  Having
> > crc32-$arch potentially be running the generic code would make that misleading.
> > It might make sense to keep it working similar to how it did before.
> >
> > But I do agree that we could probably get away without this.
>
> While testing this patchset I notice that none of the crypto API drivers for
> crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> system that uses those algorithms (such as ext4) just uses the library APIs now.
> That makes the "check /proc/crypto" trick stop working anyway.
>
> I think you're right that we shouldn't bother with patches 3-4, and I'll plan to
> go back to leaving them out in the next version, unless someone yells.
>

Agreed.

If we need to make this distinction, it might be cleaner to use the
static_call API instead, e.g.,

+DECLARE_STATIC_CALL(crc32_le_arch, crc32_le_base);
+
 static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
 {
        if (IS_ENABLED(CONFIG_CRC32_ARCH))
-               return crc32_le_arch(crc, p, len);
+               return static_call(crc32_le_arch)(crc, p, len);
        return crc32_le_base(crc, p, len);
 }

and use static_call_update() to update the target if the feature is
supported. Then, we could check in the driver whether the static call
points to the default or not:

+static bool have_arch;
+
 static int __init crc32_mod_init(void)
 {
+       have_arch = IS_ENABLED(CONFIG_CRC32_ARCH) &&
+                   static_call_query(crc32_le_arch) != crc32_le_base;
+
        /* register the arch flavor only if it differs from the generic one */
-       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
+       return crypto_register_shashes(algs, 1 + have_arch);
 }
