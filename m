Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579A1459F8
	for <loongarch@lists.linux.dev>; Fri,  5 Jul 2024 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720167192; cv=none; b=KjlXQFkCT4lc+W/HHYYsGeLiCfxRZz95o5YSZ+k5gIT3D7dTfsuq9NGTy82tIW9CiPrpayfH7+InooWAGjO/k9ixQaoYSirNi3lxUJm3ZmiWttgkNl3JlNz7P3BwUmNqGimKRMjyICcCC2ahw7WAygV1KY0UlYXLmadDOQxYo5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720167192; c=relaxed/simple;
	bh=r8RsOl90vUmFb3iH2mDrRyejM11RkeHxvGCGNnKIo5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/QOQYtF88k4XGaLfAFm+N91bWDo82cXqN1sjuQn7X/CPN8JfKCBlL5HIVnvK3HItOtFyegsQqv6EAsYsfblgGOtlGLqjVFBNvwjBCWqN7U36UzEvRjtZelO5fN4tMIz5YXJvx1unFKYS/cxLZb2G+W5dLLE9/ZV/KWJ7BTG5xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6504101cfd6so12313517b3.3
        for <loongarch@lists.linux.dev>; Fri, 05 Jul 2024 01:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720167189; x=1720771989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipFWrtbP2pnadKQDEjq7tVSKBPDnD8noGTMoh58siUs=;
        b=Rm7LHd3cqxJ7Zu0Y8PGUjsL/1TqRNbHbagExw4MxNWk+UbT1J5mhi2VcKsQQhJv9Gb
         27cOXI6DJUYYm5fSJdVlXKSWGewwELWXXDMjgKK3rmNG2cUa+uos2lIhoMdnXcjWanoi
         zLYyOUCJcm2ypnK5PtbpFOL9XUpDvTjXOXgMLLJKwus/z79UKcwjNsotSiCoOJyb1H1g
         RSH9xEHRiu+cZP/0lvZ0t2+6MDtFSP9NmOGiLxoj2KquqI8XKv9jnKjS3CegFoJQNAcY
         sesqXAOkGQ77cBACIzXCJCQ6J2WA37wbRf+ngWHysylWLbhcNvKoASKw5v4pdxHECKJ4
         bAWw==
X-Forwarded-Encrypted: i=1; AJvYcCWgwIb4CxLW763thz9PsUx+9LO2TsQxADbsA5WyfylxyBfQfGnBSFRdLljkndpgdNTX2SyD2tk24PmEyYOE1orz9LC8J7CHQ8y8
X-Gm-Message-State: AOJu0YwJ3s3PEWqw9clNY81oJOLKlaWqnmMoM/ZIOee1sedVn2tEB+uI
	u0vGrdq4bpe6Xw3sWfvqoIsC5Bx+uEeIoWZnSMB8qfe5QjBseN0mILRff+xA
X-Google-Smtp-Source: AGHT+IEdmzyjCxGmrDd3HBiUoMFjT0PExDnWrFJ5YHiNrnd+NmE4SEiGXaPorc2ixZWQCbeQi3IAmw==
X-Received: by 2002:a05:690c:6801:b0:64a:8767:b069 with SMTP id 00721157ae682-652d61e9e30mr44577807b3.3.1720167189150;
        Fri, 05 Jul 2024 01:13:09 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9c4fdb83sm27409467b3.143.2024.07.05.01.13.08
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 01:13:08 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-650866942aeso13016277b3.0
        for <loongarch@lists.linux.dev>; Fri, 05 Jul 2024 01:13:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWhVIgrevfjT7Xm3Bm8t6Lw+HSectyTrkrHxyQmLqOBQ+iQ6GOT1rMi9shDs1KXk51U5adWOQYQSMUUhpJnRPNrGUqKf6YWslQf
X-Received: by 2002:a81:431f:0:b0:633:8b49:f97c with SMTP id
 00721157ae682-652d842fd27mr38728927b3.37.1720167188020; Fri, 05 Jul 2024
 01:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240704143611.2979589-1-arnd@kernel.org> <20240704143611.2979589-8-arnd@kernel.org>
In-Reply-To: <20240704143611.2979589-8-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jul 2024 10:12:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV-JtJWixt8J45rhZbpb7S90EDhp=x5iGGBhmUZyyQSnw@mail.gmail.com>
Message-ID: <CAMuHMdV-JtJWixt8J45rhZbpb7S90EDhp=x5iGGBhmUZyyQSnw@mail.gmail.com>
Subject: Re: [PATCH 07/17] clone3: drop __ARCH_WANT_SYS_CLONE3 macro
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Christian Brauner <brauner@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-openrisc@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 4:38=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When clone3() was introduced, it was not obvious how each architecture
> deals with setting up the stack and keeping the register contents in
> a fork()-like system call, so this was left for the architecture
> maintainers to implement, with __ARCH_WANT_SYS_CLONE3 defined by those
> that already implement it.
>
> Five years later, we still have a few architectures left that are missing
> clone3(), and the macro keeps getting in the way as it's fundamentally
> different from all the other __ARCH_WANT_SYS_* macros that are meant
> to provide backwards-compatibility with applications using older
> syscalls that are no longer provided by default.
>
> Address this by reversing the polarity of the macro, adding an
> __ARCH_BROKEN_SYS_CLONE3 macro to all architectures that don't
> already provide the syscall, and remove __ARCH_WANT_SYS_CLONE3
> from all the other ones.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/include/asm/unistd.h                 | 1 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
