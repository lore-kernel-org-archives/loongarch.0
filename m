Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D7E13633F
	for <loongarch@lists.linux.dev>; Mon,  9 Jun 2025 08:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749456941; cv=none; b=FTbQGig8ZWxz05MAvMCIFiWgC8WfpeWB08bmHh5lxG5p1+WGbnBa08RvJfKgabxqMwbLDZSps4D219OI2SI/TXAyC9oKet+jeDhYVcuQE4lm0cBlG0Nv1RPZYvL7jbMhLWT4YbkGRQ8eOTcITbOwueSAeF65FTqXh2iiJVG/OV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749456941; c=relaxed/simple;
	bh=6biSLqDt8gO7ruJmOh16RBlP1yDZqTM/WuIwSMjWngY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjB6j+wMfR1kqPWxPdGDxRdYehXqn6kQ6CmeVwLWypJj8hWXpigXSKiRfnu9GphYFa0KkzjdFvwoE6r61HZ/Wxv3LyTAMqrUNtAoEFPrGTqbuAC3fapMtNefgJMo9yvGoPUYm4N1YonO5978Uo/ucHkUQkh1ELE8swxFAwN0mro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViSA0sKB; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViSA0sKB"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a4323fe8caso26877271cf.2
        for <loongarch@lists.linux.dev>; Mon, 09 Jun 2025 01:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749456937; x=1750061737; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=ViSA0sKBZayOEAEncoPWURgLCChZZeHo9s3fSsVBQBG0d9kZx3koGHpMUqPWgSSCZA
         rcHIuZQVvFECkks3QQnUVrgDve6pUAZYH3LpEppI7aV0IJAjcYYV2KzRDezgthtoGI0m
         T/Tf2lkQHKWx5/Ioox5BrTRFdX66oy/Rdff9KYXFMq5KZRcrLmlBFLFbuPKQGzIcKDpk
         OTq9oWgm+z/YJC3gaJRF2gSOgXb7WcvOy1Lh6F3ncxpfp+satmIICX5lwF1+DOIoQf6F
         aaJYef+y6WPHpGUWJ2HX86Ta6WZmvCcg6pwjddetv3uQQUiRFv2SxjixNVR59kEB6YHx
         zJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456937; x=1750061737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=avUZtz3QyLzrtWeLJ2NgcAc7qvPmPgbfgTpeZiYZBXg=;
        b=jLvydmJin8+VTCp4nMvIqcJP5uuvYmkWMxsCnx9wdL9saVy+ybw+uEaOcXORZ4XKQF
         cJvgrwc30uBQMCpARkQLYfLuP4jBbjKz69QNKzsYlNaMhqQK6UCKjGCP9fRalAAoKUsr
         gp0HbGoG3Ip02njXvgwzCG5JcGV8od/Wg9Ry1obDwxqC1I26Z/43swOGtJcLhvmATeXU
         ud4nYFSSczt6/9w3XNmvBC1NPZau/DjD/ct3k6Cnb6KPbsJrfgoZlSffaJIMBxVeVsD9
         4uC0ANfroPIE9J2AfZ1a34WhvBpNc/GxqkyDSG22b+7QJ22TLSQoi9HCeqhCMc+5YjZS
         qk0A==
X-Forwarded-Encrypted: i=1; AJvYcCWkscXQ/AjK072i05hCQSnq5Opx9GWP8gu9fO3Y34xDm22Pd+Jq6oozrF3Q8DswwjFI1whCTtT/otI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzsiHF/PMFNjwLDYcWLP6gO4Q4DO8+ezEK/nzDX6yAdGkbjQEFX
	j1qArClmMPYw4C6o/X9vSD6s6TPzP8S8hqjcAbSPI6Y/tYpnyzntQZTqj9AqGelsZRDs1Re7NFV
	/4BwxxEteWk+5DrqPziyCN3KXFyxjkYM=
X-Gm-Gg: ASbGncukwCDoxmTAqsi6Osigu26AL4HQoc2rZlH63tDo+XgcInz0sRvIwPx7D1RdPoZ
	orCMNrFMf7RatW5iJlamlnkHJ2PMQo5eySe51n4CA57eWEHPbt2bLreYMDf9bwOmAewU48xmIBZ
	oD/beN5wg+fkk+SeP7RBZvUEXRH2shcGbF
X-Google-Smtp-Source: AGHT+IH9me4CEdVFtIOCuIg1XAKf5VF3TkyjvnvcV85fkEmF6RBw78F2p/ZOsZjFija3GtR5SXP0ijToaYQxk0VMGhA=
X-Received: by 2002:ad4:5f09:0:b0:6fa:c81a:6204 with SMTP id
 6a1803df08f44-6fb08f50942mr228433326d6.10.1749456937558; Mon, 09 Jun 2025
 01:15:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607200454.73587-1-ebiggers@kernel.org>
In-Reply-To: <20250607200454.73587-1-ebiggers@kernel.org>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Mon, 9 Jun 2025 18:15:24 +1000
X-Gm-Features: AX0GCFtpUUxU8yEaZey6YSh4XuBhQlOITIBZOiB21tfxDGQbnIThjp-0HFxjxHQ
Message-ID: <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] lib/crc: improve how arch-optimized code is integrated
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, linux-arch@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Sun, Jun 8, 2025 at 6:07=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> w=
rote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/li=
nux.git lib-crc-arch-v2
>
> This series improves how lib/crc supports arch-optimized code.  First,
> instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/, it
> will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> functions (e.g. crc32c_base()) will now be part of a single module for
> each CRC type, allowing better inlining and dead code elimination.  The
> second change is made possible by the first.
>
> As an example, consider CONFIG_CRC32=3Dm on x86.  We'll now have just
> crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> were already coupled together and always both got loaded together via
> direct symbol dependency, so the separation provided no benefit.
>
> Note: later I'd like to apply the same design to lib/crypto/ too, where
> often the API functions are out-of-line so this will work even better.
> In those cases, for each algorithm we currently have 3 modules all
> coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> sha256-x86.ko.  We should have just one, inline things properly, and
> rely on the compiler's dead code elimination to decide the inclusion of
> the generic code instead of manually setting it via kconfig.
>
> Having arch-specific code outside arch/ was somewhat controversial when
> Zinc proposed it back in 2018.  But I don't think the concerns are
> warranted.  It's better from a technical perspective, as it enables the
> improvements mentioned above.  This model is already successfully used
> in other places in the kernel such as lib/raid6/.  The community of each
> architecture still remains free to work on the code, even if it's not in
> arch/.  At the time there was also a desire to put the library code in
> the same files as the old-school crypto API, but that was a mistake; now
> that the library is separate, that's no longer a constraint either.

Quick question, and apologies if this has been covered elsewhere.

Why not just use choice blocks in Kconfig to choose the compiled-in
crc32 variant instead of this somewhat indirect scheme?

This would keep the dependencies grouped by arch and provide a single
place to choose whether the generic or arch-specific method is used.

It would also allow for alternatives if that ever becomes a thing and
compile testing of the arch-specific variants if that even offers any
actual value.

Thanks,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
