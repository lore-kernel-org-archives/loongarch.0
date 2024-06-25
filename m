Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F59C1DDF8
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719322117; cv=none; b=XZmorRlnoF+6WGgkMmK2PmeqGR/nc5JjuktpYZ1Y+HsF7ovJYPSnz67e4vhLr2lach2dQ0yONqTPJqBEwIqVSQ69lIHmzXpEnMMsHjPhjIJXfTF8WD4YYuwYUK2VWN4ccinf/fhGhVGJJf+zqjGef9reseh3XpuEWIVA9dOfaX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719322117; c=relaxed/simple;
	bh=z9OmWM3s1K1ncuEuDaWGd5+40KI3CtsDflUO9C7WTmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3wYspH3MxbUCBXKqSmqQP2/pAC0qbhEJNuczvmDf9X/e0NFFNA+jz0iHazcqfAZeIRATbpPjFFv/+bL3hq49wdz4OVie445LGPoCt6DeLTtMpyiLdm89zHSw3IvKorv6k3yDmFdIOahbbgIHGNb0vhZTEuyso7hi9VBWoWuiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XWItpGKx; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWItpGKx"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7252bfe773so277326066b.1
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 06:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719322114; x=1719926914; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twrq3YnBSjJhRTnvJDFrfdhu7ZaNu/NjtYoaAMWAVO0=;
        b=XWItpGKxEp4OvpErbCcPcrziM1VBm+PM1swBBKx4cTShiH68gR+RKj0WuwoNENLijv
         cLxlVy/EIsVOwyNnguEZbJwB6UkmUPEHAUtC9UwZ73MF9SWn0/GOsy+r/kWn/oCreSo5
         JTp8acZW4OzbXEoTgWpHYgefnd2lyHv7vtPFWsqSeupATpcK9qiMDyBlqIVlDKMQW5vS
         KFMljmLe3lNJaABwHjSC/2twFAA6b7a7lllIeMId0oHqIjeTk0vOjzdcvXtjZLfEl7Rz
         +PEuUuHdQq20g9nFBwcShe/VrfV86EE0+923uoVEXn3JKppxnXXS4OPKsBmiWcMou2vr
         fk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719322114; x=1719926914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twrq3YnBSjJhRTnvJDFrfdhu7ZaNu/NjtYoaAMWAVO0=;
        b=lQrDelOy1ryfW0Lr1qV3gVpN6+ajC/I1qZpsE03tRVn5R7I1yUNUyApR2SN/OuqgIW
         hVueSXotxFyxyArKl+/Z5FbEbt+Euoz+DNQYteJk2n5pfxiYrptd6NIapsJgHaQX9eKF
         csCuXi0Ql3tq9qTbMsmF3++ZUGeyrqj5WQEGDWWf3Rh2JuF4u3EzGGW9Q1hMSNe927o3
         361/Sf81LA8izFk/Booxwxnxdrko4wZKQpdQif+kgkdStM8D4d/qbFTzD4L0MJyrBAp8
         Xi51x+mdfveE2bpfpMWdJ5+V8WzVSmMDu/P42EtuUjgW2XXWm/Rk1MAQv2Gutl7wmWfA
         cfgw==
X-Forwarded-Encrypted: i=1; AJvYcCU8YWLgJrOge34/tsy8bZXfeetlmA3YvymcObGijjtqQxxrw5YycV1d+XLKUTu/hxCrLyzk/f7stoQokuo6XZJGyl2VxdGTAnjq
X-Gm-Message-State: AOJu0YzoQoyEJiEqRwcrEq8WOo3JrgixrOoU/P0Q1w4Mnabs79GDXPA4
	fbtsG4Lr1Ujj8WU05fw2RvS4YD6V4hXFTipROBAP4HY7uBoe55uBbLUzyh4wcApDkNE9kEPij2+
	1qhbhqVRcDoAD+kQPcK9McO0hX5Y=
X-Google-Smtp-Source: AGHT+IGC9qUNP5wS0HfWpa9ydA0hwYy4dB0Lp0WzcrwuUkaDrU+VycUa7Tkz3Bvd4nc/Igdf+rsu8XiUACdnZ7+e9Gs=
X-Received: by 2002:a17:906:714c:b0:a72:40cc:22cb with SMTP id
 a640c23a62f3a-a7245ccdda4mr460752366b.21.1719322113633; Tue, 25 Jun 2024
 06:28:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625110029.606032-1-mjguzik@gmail.com> <20240625110029.606032-3-mjguzik@gmail.com>
 <fa1a8a0b01cd8c53d290cf431b9c1ffc6305ef0d.camel@xry111.site>
In-Reply-To: <fa1a8a0b01cd8c53d290cf431b9c1ffc6305ef0d.camel@xry111.site>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 25 Jun 2024 15:28:20 +0200
Message-ID: <CAGudoHHn+N2oUJH9DE86gDFxntV46CxrLtC7=B6dTOjxM4mQOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Xi Ruoyao <xry111@xry111.site>
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	io-uring@vger.kernel.org, axboe@kernel.dk, torvalds@linux-foundation.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 3:24=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Tue, 2024-06-25 at 13:00 +0200, Mateusz Guzik wrote:
> > +     if (flags =3D=3D AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
>
> Could it be
>
> if ((flags & AT_EMPTY_PATH) && vfs_empty_path(dfd, filename))
>
> instead?
>
> When fstatat is implemented with statx AT_NO_AUTOMOUNT is needed, or at
> least Glibc developers think it's needed:
>
> #if FSTATAT_USE_STATX
>
> static inline int
> fstatat64_time64_statx (int fd, const char *file, struct __stat64_t64 *bu=
f,
>             int flag)
> {
>   /* 32-bit kABI with default 64-bit time_t, e.g. arc, riscv32.   Also
>      64-bit time_t support is done through statx syscall.  */
>   struct statx tmp;
>   int r =3D INTERNAL_SYSCALL_CALL (statx, fd, file, AT_NO_AUTOMOUNT | fla=
g,
>                  STATX_BASIC_STATS, &tmp);
>
> so "flags =3D=3D AT_EMPTY_PATH" won't be true if Glibc implements fstatat
> and fstat via statx (on LoongArch and 32-bit platforms).
>
> I was just surprised when I saw a 100%+ improve for statx("",
> AT_EMPTY_PATH) but not stat on the Loongson machine.
>

It can't be like that specifically because we still need to catch
bogus AT flags.

I'm going to poke a little bit and send a v2, thanks.

--=20
Mateusz Guzik <mjguzik gmail.com>
