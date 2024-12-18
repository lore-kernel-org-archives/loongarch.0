Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CEB15B547
	for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 19:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734549743; cv=none; b=ESKJuaPsO8ZryeCqzNT8Z0AIcs0+Ts6UX2MMaQJP4Lof7VC7DCPhOTonpk02yEcFcrDYbd7qniBihGOl/BpVaewJaL3KiXm7RkQQKKf4xUZgoUBxJnI24etyTx1pjAC5hna5cvWPCYtMEg5h7hmEId8NH9luhCcRDivGM++4/ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734549743; c=relaxed/simple;
	bh=yb7V3M0jIKrEmoABkIwbxdkLm0OpNu37YBBczUTfAUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eSH974z7iin180GmxGDo19PYag2p5alXuDffH4VryGTtn/wE4O4h+PHmWdxLtJnnbxSQcJn91QMXd4x4dAV5mXYJxxHRW8SOXl8H9af1uVGM4upxODU5XOWtKdeXVIjwAXx3t0DjobaCY8GWP8oIkSgfsXH5hFeECydyQhVt8CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDwGsw6U; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDwGsw6U"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ee534d6800so1850a91.2
        for <loongarch@lists.linux.dev>; Wed, 18 Dec 2024 11:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734549741; x=1735154541; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Palh2vODSDjcUnt/pqSpnYchNicdY/YA1Ypw0pWez0g=;
        b=GDwGsw6UVb53cBAQtydbRsRwCrC2M7AP3ri+fcWVo/NYu4I0Xo/DYq0QKrX51dYh2j
         XJBcTRR6xTWRShb7P7+G0M2z43dUFipw4BNnqLqfRborl0vw1EgReKz5misYlgCvyDMQ
         X0l3myDNyH4Etr9ENgQxXYxPR0C10WO4zqcHUbRF6QEwn4cKKJbEBq0xqk0l+htR6MmX
         oBYUnFn7mXhoeKthxcEtYEEgtbp67CJdyhZawK4zWlt0kecZkNLyaN7Cfr57YtOCWuCH
         3RdtLEOBcQoj6iML4VnBDSHQdYRgveecTQkPpAZ15d5RguFn/DoINGRuDT/cSdjnidTq
         W+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734549741; x=1735154541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Palh2vODSDjcUnt/pqSpnYchNicdY/YA1Ypw0pWez0g=;
        b=RK4cNjEkq2z/TXAFhLz3feCzADMxBKsu5wIAPP7KowonLPxmY1Xh6g3W8V8ABtoZiJ
         a7QBI0bWr0Eyx99HtcEbuhBts31yObBUTaTHsHixyBoaLKrAgdpRWA2UIKbfMcCPl0Pv
         dS/aexBe6QZuU1679iZvuQIWH95XgAv0B/HXkEo/Olkh//SR7uzyYMq4Qvjryn3o/M7a
         Oq2RtIGbFg2nUxo9XjZTY3CdSWFKkNWYK6DhzoYv4Byqnbcx54LfU8vany7z0LJ5/HuP
         MgnABZFc/LzisbO9LEWpjwwWXsjzl930FIfX0CWBKp9R6QGvyoK30aekhnf0SNJ1D+gG
         qArQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZnLf2PNNG19iosV4vyz9MPvnwpBCYoZRm+dbEAmm44/qQIg/h8fnP07HmKGOYyFF1fxphEezLq90=@lists.linux.dev
X-Gm-Message-State: AOJu0YyukwyfICmNBNpVWvPzFM52WZpaQStJ4yn5Q1U1OdsDeirHaDeK
	pYsh0+guNJaX/hwdo8gFpTHPENF0WlzV6UblnqKQDrDLm4k6r4i0ky/mfqTB6NEyiSUwWtiUuIB
	W78gRtOEI943guxeoIUAtZMJQ9Ho=
X-Gm-Gg: ASbGncuQZP/x/KE8q67KH/9hpWJQIoUHKA3BuNOOzlej0iATXxx7yzFgM+OJnVQuhaX
	pb9AVxqCShJuIJ42G2IjjLLYy4TevNGos4ifTHA==
X-Google-Smtp-Source: AGHT+IEIpg8nuy30DHaReYoSwehqMfh7Ie8biuS/Pi2iGxu5VzjCpata6lZJHppkgnWTjhMAybw2JvRFtbE3N6KAhOA=
X-Received: by 2002:a17:90b:524e:b0:2ee:a00d:2ef8 with SMTP id
 98e67ed59e1d1-2f2e9394fd4mr2234046a91.8.1734549741525; Wed, 18 Dec 2024
 11:22:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241217010905.13054-1-yangtiezhu@loongson.cn>
 <20241217015006.30305-1-yangtiezhu@loongson.cn> <CAAhV-H4WpcWjrQdkm3Sx4DVbp=2oW9nNGAbNqR4BEmiryrptNQ@mail.gmail.com>
 <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
In-Reply-To: <20241218190558.g2hykmjgbny4n5i3@jpoimboe>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Dec 2024 14:22:10 -0500
Message-ID: <CADnq5_PFcHzob4poLa86_K4yP5gUT7Ei4Rz5vSUofvZTmB48-g@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] drm/amd/display: Mark dc_fixpt_from_fraction() noinline
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 2:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org=
> wrote:
>
> On Wed, Dec 18, 2024 at 10:36:00PM +0800, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Tue, Dec 17, 2024 at 9:50=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> > >
> > > When compiling with Clang on LoongArch, there exists the following ob=
jtool
> > > warning in drivers/gpu/drm/amd/display/dc/basics/fixpt31_32.o:
> > >
> > >   dc_fixpt_recip() falls through to next function dc_fixpt_sinc()
> > >
> > > This is because dc_fixpt_from_fraction() is inlined in dc_fixpt_recip=
()
> > > by Clang, given dc_fixpt_from_fraction() is not a simple function, ju=
st
> > > mark it noinline to avoid the above issue.
> > I don't know whether drm maintainers can accept this, because it looks
> > like a workaround. Yes, uninline this function "solve" a problem and
> > seems reasonable in this case because the function is "not simple",
> > but from another point of view, you may hide a type of bug.
>
> Agreed, it sounds like there's definitely a bug which this patch is
> papering over.

Yes, agreed.

Alex

>
> --
> Josh
