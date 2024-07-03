Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495841862BE
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720028456; cv=none; b=fZ922AlCm688L5XnB3+uOglVU1S6LWPOSX6HyEGLh7lEGxiFXem1zBvI1T2qm5MoQvDyMx/w8Yv0OoBRFxuzW/gevWzwiYz1LTy1DA3Me+nz99polwxZeDEKiE4XFz7inucgBenDxaixy63XEA4gs7+w1CqDEBg4Uj7L4dmJrfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720028456; c=relaxed/simple;
	bh=OmJgZmMNMA+vqsqmuMadaQXQgXYtB0kLJuTl566s2uI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F14/771q07sACr6IAmcIEf/4QPLb4lUD6JwJlPiNGX36cXzgKx/+zVYK7A4Otq+YjzRSctDwLLqMCvoMfJ5j/W7DFENbRP8CBOiwdZMvlXRJP05Omjc52nxGJOAfqC8be4TqAXN2cCLH926sD8FY1Y08qeXWIfF23SSdkv2xg50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IPDmiJ3W; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IPDmiJ3W"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so63908461fa.0
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720028452; x=1720633252; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kNRq2xwEntheuQ6TeaPDnSkqCd5DNGo6bKIeeb/W6x4=;
        b=IPDmiJ3Wp/+basuT83ONlCFfqZa3BhPK+8XpZ8KHcfQ+tPQweFNaNFvDLCBdFUY3Pp
         fziu9f3hC2HgmoyJI+6uBhkn8hevSNp3I+la/Qd4XHUtDhiHtw5lqDkzMXyo6a7HwH7y
         myaBPpeEqjuIFFhOBCs1Z+MLndPcF0SVEjv9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720028452; x=1720633252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kNRq2xwEntheuQ6TeaPDnSkqCd5DNGo6bKIeeb/W6x4=;
        b=W656T+UvZDOfy7kYKonw0F4e+8w81nairNvsJFYc1toYKzoqMBlvZ/jAYZqk1H9IPj
         Va1qlp3c3ivD2FLiGkqfGsFjUyNgDMdlIVp/1g4yOa+skEuUCz/ICt5hi/T2kdg2uBxy
         xz7g0sOcqInCn4jetLnhxhOYsK5a2a4ZeXFT74JMj61an4rI4qk9svgnEg9TloD8ik45
         1LgvqC7xjQWvvsD+it7SY+sVLYvCjka+iM421AgbcYInrbt4X4AHu9dnfWAcViJ3q/OX
         RobFUTAlXT1FFDX3aKIQdjHrA5XoUQWVZS1PWttndf/BK1pVmMDZi5e0T/8RyVe0W3jd
         +USg==
X-Forwarded-Encrypted: i=1; AJvYcCXu41kNrXfpP3zVJfuzY5XtwSOc6FT4OVaVUoNuXcL142iLsCnu+TIeNhbC/3IoNFm35WHTlfD7Ka6gQuqI0fMWPfMVrag8n4s1
X-Gm-Message-State: AOJu0Yx7cpcK+pLgBDq+v/cebfWDxmTbYaBwZWcjChNtP4Ia/FBtup8c
	H8XFGG2d/AcTFM1wKnNTEvXnjL5hW4DeE87rWhjI73QDTe48Vl6pP68eBJgRAdGs1dnkrSNjWmu
	7IHY+BQ==
X-Google-Smtp-Source: AGHT+IGXRVN9UA1qI8E2anthTirMaFHsrVy/R/OWKevQm2M2nxEJ8b23f+SnXJKRz0ftpTI5XSsgIw==
X-Received: by 2002:a2e:a989:0:b0:2ec:54ec:1741 with SMTP id 38308e7fff4ca-2ee5e36d166mr99421971fa.18.1720028452244;
        Wed, 03 Jul 2024 10:40:52 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee8842b920sm1576651fa.39.2024.07.03.10.40.51
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 10:40:51 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52e99060b41so937809e87.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 10:40:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXePzV/JgdBXuVHV/aw/nCBLBL1c5v4uhchNr9MtUX5+QnSt17UCudDrdVbE14O4Z1xiHaBKpJ0I2tqgEYPquvyEkE0g2yKT+us
X-Received: by 2002:a05:6512:ac6:b0:52c:d90d:d482 with SMTP id
 2adb3069b0e04-52e827459a3mr8256135e87.66.1720028450692; Wed, 03 Jul 2024
 10:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625110029.606032-1-mjguzik@gmail.com> <20240625110029.606032-3-mjguzik@gmail.com>
 <CAAhV-H47NiQ2c+7NynVxduJK-yGkgoEnXuXGQvGFG59XOBAqeg@mail.gmail.com>
 <e8db013bf06d2170dc48a8252c7049c6d1ee277a.camel@xry111.site>
 <CAAhV-H7iKyQBvV+J9T1ekxh9OF8h=F9zp_QMyuhFBrFXGHHmTg@mail.gmail.com>
 <30907b42d5eee6d71f40b9fc3d32ae31406fe899.camel@xry111.site>
 <1b5d0840-766b-4c3b-8579-3c2c892c4d74@app.fastmail.com> <CAAhV-H4Z_BCWRJoCOh4Cei3eFCn_wvFWxA7AzWfNxYtNqUwBPA@mail.gmail.com>
 <8f2d356d-9cd6-4b06-8e20-941e187cab43@app.fastmail.com> <20240703-bergwacht-sitzung-ef4f2e63cd70@brauner>
 <CAHk-=wi0ejJ=PCZfCmMKvsFmzvVzAYYt1K9vtwke4=arfHiAdg@mail.gmail.com>
 <8b6d59ffc9baa57fee0f9fa97e72121fd88cf0e4.camel@xry111.site>
 <CAHk-=wif5KJEdvZZfTVX=WjOOK7OqoPwYng6n-uu=VeYUpZysQ@mail.gmail.com> <b60a61b8c9171a6106d50346ecd7fba1cfc4dcb0.camel@xry111.site>
In-Reply-To: <b60a61b8c9171a6106d50346ecd7fba1cfc4dcb0.camel@xry111.site>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 10:40:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjH3F1jTVfADgo0tAnYStuaUZLvz+1NkmtM-TqiuubWcw@mail.gmail.com>
Message-ID: <CAHk-=wjH3F1jTVfADgo0tAnYStuaUZLvz+1NkmtM-TqiuubWcw@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Xi Ruoyao <xry111@xry111.site>
Cc: Christian Brauner <brauner@kernel.org>, libc-alpha@sourceware.org, 
	"Andreas K. Huettel" <dilfridge@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 10:30, Xi Ruoyao <xry111@xry111.site> wrote:
>
> struct stat64 {
>
> // ...
>
>     int     st_atime;   /* Time of last access.  */

Oh wow. Shows just *how* long ago that was - and how long ago I looked
at 32-bit code. Because clearly, I was wrong.

I guess it shows how nobody actually cares about 32-bit any more, at
least in the 2037 sense.

The point stands, though - statx isn't a replacement for existing binaries.

             Linus
