Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D0A2BE053
	for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 23:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758064820; cv=none; b=XF3Y6vLF/n30zeY4rXkhiY4R51PkRXMel5kSYMtY/E748SBcUKt0iDTDBPRxKIHbpVnT8ZhNiK7Hde4ZRi4FL1zT/uqZSmyaFv/+o7GZkxEm/V3gUNymNGXM7FQ7ypjUbRFrrtkmemSce42CNNA3NuBx5NLis70/hgoGuIh7lRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758064820; c=relaxed/simple;
	bh=8TP/U6EO6FSYI+4jmHqjMS4o48NmZbaRlupvr8P30TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTjOarqY02POvKNPmVRbZYRykS7SRfdHLoxPpG0b9v5hO77Y/z1pgxtf6wE6SwEfKUSdcUNRZJmR2kcANz9pDaVhnavmDb4FbFA4MtkYxzgRPckTSD+1jRgprLfVkCFIPc1Vt12N5NNC3b1wwN+LigmRcQWHlnaIGkD6mPmZT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=N1OpEAsc; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="N1OpEAsc"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-3197f534179so4272015fac.2
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 16:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1758064817; x=1758669617; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wrEMNHKwYr/02yPBL8fxjj+3KhJzD85mECDAPLYkhT0=;
        b=N1OpEAscYrLd7f3+Kcd5Oz8ky0S88sv7gi4cQC7CQd8cYeQ1OC0SdnmB5AIsohXvRR
         WO/DJ51VCKPUL42jGHiuDBiEML0tYOEUCXCFIpZzu+GTPQSXypT4/x8or0ilyZeR3HgV
         /7bouiAf2VDV8rMHwf6j7OZZi0IEYw87hGTo70jiOUfaEPfewzDzbVSgb1w4k7aaeeli
         fa5SWEYoo3xUFk//h5xvlpiyLH3mqo4t++MMnWN59SCb7SMQekbprmh+jsCrq9SiPwl2
         Ll8IK1se06XQ891oPsNuXTQENbFgXpIp3BPStd9xe8JJLr9YstL24yHdcuiVytIvQl3m
         WJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758064817; x=1758669617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wrEMNHKwYr/02yPBL8fxjj+3KhJzD85mECDAPLYkhT0=;
        b=w8Dlysr+789qo4KmmSRW9i8wyWOJL37cTSzz/UnnllyKluDbXzZj4pvluoJuRABFVR
         kPCpftSlSl8LEeTtr13kFeMsnf/8kvuVUypv3eJJZMApAMoNgNmxO2hbJrwmNlV3OQxD
         WqlD2LrORpow2PHeOWpwWuz4SgHYLhAHhRKDnaZIjK/Bu4Htgfl5658YpU/iK48IgeXF
         xt66TPQJG+lu6c1J0CW4o5BHpoqyLoUOi2R7EX5eraMRmxjoUUj9z+AsplVrwrN73Vml
         Q4kK8Z1BlK0fDrOlCv7sT5XQPvZ+juIj8dw0dymvLx7jA9X2JHWzjZ8AqgVeX9svfiAs
         zpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP6FMcE/s6lK+SL6Eb1LPQjn5ewQiYHBA23v+02dd55wu6Rl0G1aQ+IAghqxd8Vt6g9gULUf5CSCM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/pt4B7OradqBA5ASMWucJZylqzbcilZwXjwbi+jgeltmnHP2i
	gg4EerH4CXu3I7Kmyw0ikdElvLTyktkCIT4H8pMtsV8HlyWHwXIftR3scmKkhjgW5sc=
X-Gm-Gg: ASbGncuLHNhrgLJaINXHCM5khHeg+rp2HPvd76VNnkVQ0J0BhV6B6KWCUL/tE1sYQVk
	7O+zEU3b9rjzNeqL3suteEpSmtAP8ZieHgkfYiLRRyn1bU9n/jLKqibKsj2rFO/lHuqFQrhNu2f
	SHLzyYES8lZtYYoPPDJWqNpsQiGDoKpBekO1wFrFsYs3GXSoVce0lhskZY2vxvf5dp4Peucy1UG
	D3Y2Ebfzs9zVk0kD82Rk1MDG3ThBku/3AyoJvL58of7hf/AcAqfSnzEt/DPudDRk9FKhEzft/C0
	lUESfqrX6oZ/pBUY3DN/K7pxiDQgHdOaFPpfrFh5XYpXCpKKe1W2WSDSHj6CGNrAynT4hQBQs36
	QOrG/NpuRY89ppihDrQG90agApeZUFfsH/Sk=
X-Google-Smtp-Source: AGHT+IHFZz1ctDlZZkhP4iHGu+C0RukwNgJ0/Rqt2jFZKAtmZEiMKO57mZJI7ViSusQ/kdwk5QrNDA==
X-Received: by 2002:a05:6871:5809:b0:31d:8c1f:410 with SMTP id 586e51a60fabf-335c066873dmr91436fac.48.1758064817432;
        Tue, 16 Sep 2025 16:20:17 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:d2d4:a69:5fcd:4e2d])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-32d35380409sm5268258fac.18.2025.09.16.16.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 16:20:16 -0700 (PDT)
Date: Tue, 16 Sep 2025 18:20:11 -0500
From: Corey Minyard <corey@minyard.net>
To: Lee Jones <lee@kernel.org>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Corey Minyard <minyard@acm.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, jeffbai@aosc.io,
	kexybiscuit@aosc.io, wangyao@lemote.com
Subject: Re: (subset) [PATCH v11 0/3] LoongArch: Add Loongson-2K BMC support
Message-ID: <aMnwq3i0qMREnjI7@mail.minyard.net>
Reply-To: corey@minyard.net
References: <cover.1756987761.git.zhoubinbin@loongson.cn>
 <175760122164.1552180.16853979882678693472.b4-ty@kernel.org>
 <CAMpQs4JbQU3D-Bs2687BXSC=FKJBS6RMvWAKb6AJEtzit6hWqw@mail.gmail.com>
 <20250916084002.GF1637058@google.com>
 <CAMpQs4+J2zYgZaGYBSaf4UwzKZY-qMoD1oe2vmgJQXAfghqu=w@mail.gmail.com>
 <20250916101438.GA3585920@google.com>
 <CAMpQs4+kj0i1BpJ4Nk+Z=Ov-AMEWcqPmkbruNhD--TmycX4z-Q@mail.gmail.com>
 <aMl_47OOOotywm0U@mail.minyard.net>
 <20250916160845.GB3893363@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250916160845.GB3893363@google.com>

On Tue, Sep 16, 2025 at 05:08:45PM +0100, Lee Jones wrote:
> On Tue, 16 Sep 2025, Corey Minyard wrote:
> 
> > On Tue, Sep 16, 2025 at 06:51:25PM +0800, Binbin Zhou wrote:
> > > On Tue, Sep 16, 2025 at 6:14 PM Lee Jones <lee@kernel.org> wrote:
> > > >
> > > > On Tue, 16 Sep 2025, Binbin Zhou wrote:
> > > >
> > > > > Hi Lee:
> > > > >
> > > > > Thanks for your reply.
> > > > >
> > > > > On Tue, Sep 16, 2025 at 4:40 PM Lee Jones <lee@kernel.org> wrote:
> > > > > >
> > > > > > On Fri, 12 Sep 2025, Binbin Zhou wrote:
> > > > > >
> > > > > > > Hi Lee:
> > > > > > >
> > > > > > > On Thu, Sep 11, 2025 at 10:33 PM Lee Jones <lee@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Thu, 04 Sep 2025 20:35:04 +0800, Binbin Zhou wrote:
> > > > > > > > > This patchset introduces the Loongson-2K BMC.
> > > > > > > > >
> > > > > > > > > It is a PCIe device present on servers similar to the Loongson-3 CPUs.
> > > > > > > > > And it is a multifunctional device (MFD), such as display as a sub-function
> > > > > > > > > of it.
> > > > > > > > >
> > > > > > > > > For IPMI, according to the existing design, we use software simulation to
> > > > > > > > > implement the KCS interface registers: Stauts/Command/Data_Out/Data_In.
> > > > > > > > >
> > > > > > > > > [...]
> > > > > > > >
> > > > > > > > Applied, thanks!
> > > > > > > >
> > > > > > > > [1/3] mfd: ls2kbmc: Introduce Loongson-2K BMC core driver
> > > > > > > >       commit: 67c2639e1fc1a07b45d216af659c0dd92a370c68
> > > > > > > > [2/3] mfd: ls2kbmc: Add Loongson-2K BMC reset function support
> > > > > > > >       commit: 2364ccc827e44064e9763f2ae2d1dcc5f945fdf3
> > > > > > >
> > > > > > > Thanks for acknowledging my patchset.
> > > > > > >
> > > > > > > I can't confirm why you didn't apply the IPMI patch, but this appears
> > > > > > > to break the patchset's integrity, potentially causing missing Kconfig
> > > > > > > dependencies (IPMI_LS2K select MFD_LS2K_BMC_CORE).
> > > > > >
> > > > > > Pretty sure this doesn't break anything.
> > > > > >
> > > > > > What build errors do you see as a result?
> > > > > >
> > > > > > > Additionally, as Corey previously explained[1], this patch can be
> > > > > > > applied through your side.
> > > > > > >
> > > > > > > [1]: https://lore.kernel.org/all/aFVtNAY4u2gDiLDS@mail.minyard.net/
> > > > > >
> > > > > > We only apply cross-subsystem patch-sets to a single tree if there are
> > > > > > good reasons to do so.  In this instance, I can't see any reason why the
> > > > > > IPMI driver cannot go in via it's own repo.
> > > > >
> > > > > However, there still seems to be a text dependency issue. The IPMI
> > > > > patch modifies the MAINTAINERS, which depends on the first patch.
> > > > > If the entire series of patches cannot be merged together, does this
> > > > > mean the IPMI patch can only be merged after the MFD patch has been
> > > > > merged into the mainline?
> > > >
> > > > No, not at all.  So long as all patches come together during the
> > > > merge-window, there is no issue.
> > > 
> > > OK, I see, thanks.
> > > 
> > > Hi Corey:
> > > 
> > > What do you think about it?
> > 
> > I thought my ack would be sufficient, but I've pulled this into my tree.
> > I can't apply the MAINTAINERS portion of this, but that can go in
> > later; you can send me a patch for that after the next kernel release.
> > 
> > I'll make a note to Linus that this depends on the MFD changes.
> 
> Feel free to separate that from that patch and I'll happily apply it.

That's great, please do.  It's already separated out, and the rest
is in the next tree.

Thanks,

-corey

> 
> -- 
> Lee Jones [李琼斯]
