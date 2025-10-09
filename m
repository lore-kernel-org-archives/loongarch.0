Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84EF2E03E8
	for <loongarch@lists.linux.dev>; Thu,  9 Oct 2025 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760008784; cv=none; b=riMRqJ6DQUXFs1UUlI7T/3IfQgdfspFGI96sxVABBMA/oCDypeQW+W4i+J/Ritp10G69Fz38tx6w3wAxRCmHNms2K0jkD2YZKhZd/I7M0n2hDPo3AXB4GeFqSV7oNCGl4qkbwTdSlYXCMMP+tjMz1P1jTFJoHcKZOKYciKtcO3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760008784; c=relaxed/simple;
	bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXwfF5ownZwPeBVB93kCipNIujQMBa3+eksIMLaMhSd6GCPV+8T0aaQvjIuFfSnLM26Gi9bu0WtBg1bB/mcDV46w1HQobaKz/dEkFq3MDcDYWBdewA/EjCLbvEj5W9a8KZEROGwdUJNqDA9Wcu4uLJwJD0X9027i8PIPSu9IVcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuhHNbmh; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuhHNbmh"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-635fde9cd06so849524d50.0
        for <loongarch@lists.linux.dev>; Thu, 09 Oct 2025 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760008779; x=1760613579; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=UuhHNbmhDg5hmigoR5H6zMqr76D2sggOmEeuRZAuTHL8YUE03j0LVX5yflV56yBiw6
         cj8TkPn7hgo52dwqZxupgyJNq4OpxIcmT7NYup+vulpV2VJxPfAksPa1LXqai9lozbd9
         tPiBOXF+y4j9DQ+7HvoaUu8mYuZ2Mw9Z9RCaVFt0mhfU8o7FyYXR92ZyAGj4dqzMhSnr
         hFpG/cvyqICum7e0LjHudAIbl8gxpRPir/+vgbmeazgV5J38aRxBq5g31hcxykPj2z3D
         VS4yczuEJzEuHW93bzZLm/dfTTBentAflwc6J+H1MkV/+WviDW4BmFrwYHdBLejh47LR
         cZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760008779; x=1760613579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzeWOdj3lBj+Ke0QviDFWI2aF1kcLsskxWN0A79AnHU=;
        b=Qu/3LS3rEbPFGj6yvlyJvc9PV+8znvCE1rkFPk8xFUUklw+2ZjeoKsvDW67cm3zOAr
         gz9glKjtAoBqS14vYiRo8e6zyuiqMMxR6Lmah2B7iCpWcl3NZJOipdpiQ1V1wBwbyaFY
         d8B/MmAKTOjkpioQaa0+wPqj81NXiU37BfTSa05wpMOEjV+JDKCSUMnpBcO8FLa1VoNe
         rnm2qA7IVy3l2p/JwjJ0R9XeDZ395sZtrkmTPX0oMWIzPF0GCFyiVuhsmYHFYv77CJNw
         2mu2qOcM07dPQbBQc1/jQ20yZZeRiew6RS14inaa9rLo/59K6O4oHco2uR95ihtVUiML
         w7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8xOCf9S3iGzA/jLfMnGaBO0BXUC7HrXKz0W4xZ8WJFowTCUurFdI/3OkqTf5f7EO9xFaqZumS6pQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0tMajYkudi7XJRcEbW2IZoqk5iFxZrQaMJK6+EnVJMWKklQGT
	pV8vjkFbyiyOiRVojK/BcvBQABuKWeLaju1gucoBmzufPr8x5ycjvTMRDejVKlVkIuOo836tquU
	t8polNmdBqJxetQDXRsT7Ucvz7fYrknI=
X-Gm-Gg: ASbGncv16OXwcDgsEA2kL1nDrKhQlQob9iwlaK5cpHWD0BfS6kSrRg0FkjQ53VW3UVN
	m7JjCyCZmd4IG3BdPJxog6f6dqZa1TN8+GjOAJEK8EUFFs+iH3peraESshEp8s5NYZQnexoVSmh
	sv4W9ylXShj2C8nE6/YYWKUrn54srN0YU7OLJ1XLBbzbF+01oN9Lp71P+7Y+a3ydButGwT7LL6c
	LSd22KulWeEuUouo3tDscfIj4+p3a4=
X-Google-Smtp-Source: AGHT+IE5U7JyGi1AmeLjDi25hUOta+sU2hpJbVTN9Ai63ARDyOdLqRjdCN3h5Wr4u+tqZlHZJ+/pg/7Xr5jCWFq4BIc=
X-Received: by 2002:a53:d048:0:10b0:63b:8e80:c017 with SMTP id
 956f58d0204a3-63ccb672a0emr6807745d50.0.1760008779377; Thu, 09 Oct 2025
 04:19:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250913054837.GAaMUFtd4YlaPqL2Ov@fat_crate.local> <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
In-Reply-To: <20250913055851.GBaMUIGyF8VhpUsOZg@fat_crate.local>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 14:19:03 +0300
X-Gm-Features: AS18NWAGN6ExXhEWeXK-ERFvGpf6JdjWShiWpIPYOnPjMCR9bXVHwIY8E_1WxIc
Message-ID: <CAPnZJGBwFqNAybORpTtRfjtGwMQiBtd+rATD=mh8ZgE3owT_ow@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Borislav Petkov <bp@alien8.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Graf <graf@amazon.com>, 
	Rob Landley <rob@landley.net>, Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org, 
	Ingo Molnar <mingo@redhat.com>, linux-block@vger.kernel.org, initramfs@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	"Theodore Y . Ts'o" <tytso@mit.edu>, linux-acpi@vger.kernel.org, Michal Simek <monstr@monstr.eu>, 
	devicetree@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Heiko Carstens <hca@linux.ibm.com>, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 9:00=E2=80=AFAM Borislav Petkov <bp@alien8.de> wrot=
e:
> Ooh, now I see it - you have virtual and physical initramfs address thing=
s. We
> usually call those "va" and "pa". So
>
> initramfs_{va,pa}_{start,end}

Okay, I will call external_initramfs_{va,pa}_{start,end}
(after I will remove initrd, which will happen after a year)

"external" means "bootloader-supplied" as opposed to builtin initramfs.

--=20
Askar Safin
