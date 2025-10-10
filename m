Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5FB182D0
	for <loongarch@lists.linux.dev>; Fri, 10 Oct 2025 04:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760069264; cv=none; b=fLTFLW56vrpOmTEWxio+6PLGWpnNbXjmUw5SmKRhBBQ9euzwCcYhFYReoNGNeQveuJeiwAOOPIEGXH4lhXGshe0N3PEqu23/qYjV2RylPBz43US7KOzKu0GM5NESsXjGMzpSewQUo9Lxq5Ikdd/LJ8XvARB2S9UZG7lySeNUKVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760069264; c=relaxed/simple;
	bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujEVVP2R7HVUPxSl+ZGagf+Or0foZzBIO/7j3peaKmXd2JdOUTcoy0ZwP8JOv2qXLvvbrCJLk1ns04epRaNXDm+iwaCkCa40cQRuZ15q5Jbaw2fqIf1R/7n67DwiVO66x0zTe+s0kBPUOdel/smorWET4XmqTwKhvlQb8jGHzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUKReZR8; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUKReZR8"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-73b4e3d0756so19577847b3.3
        for <loongarch@lists.linux.dev>; Thu, 09 Oct 2025 21:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760069260; x=1760674060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=nUKReZR8PMKgq15Dhg13E72YBY+3LVMHUvPm/2q9cwxoRUilHEj6ANEmexRNzVx8Br
         41Rnyyy9J+Q6cx4exxm24SwSD77gwN8mq/Hf2vfL587QHqQGrLk6xQlp9/4M8GHvWTvm
         drjlvu7R6ZjOYVVqo/+TfynRRTG1lwBQBioikcEZGOHNKDmJ3Dwu9rhduzVBZ1h7G9sW
         4dM/y2wpDij6wm3uf2ijEOxRJFM0QoimHSyEUPW+YnK9j0/hUncbflPbJaKhz4/rJomq
         QZQGmU3SUmhh7FvCvpkGr9/ulnjXpwiSLhltbrp+GPU0RoJT4RBkAXVZOmjq+hCMlvZr
         to6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760069260; x=1760674060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKp2kw3Tfj/wI+7DBmKCMChAalHVoRdliS5fwx1zm9s=;
        b=BhuU8VU5rHa/ji3JkMooPtZlP2nDpBsRbCgDIVsFF49Bkkggo2Xfp9HoA+9/D2KMlu
         F50m7ZsXnuAkeOxRFb1lbq9wuvdO0LMyy6YBoOdJ2jTyw1bRiQamlAU1S+ChM3oc/yjP
         FLWAenxO9xUOlD5rqqGcDtGIhtdWQdB8Z16DZllgEVS708mjTpHW+utVSBAVlbG0xi/4
         2Y2lZu3rfSltmniRMVxH6UatfKJk1ozF2POa8MmXpOYukgyid9E5ABZvKeJGF3WvN1JG
         askyt7gcr4mcDRjMSq2pu8FmBRcUEN/bgyJ/09cco4S9UgvQ1smATd77Yhv9dotL+4Hu
         aMZg==
X-Forwarded-Encrypted: i=1; AJvYcCXz37qqC28Z5DdyOc/pzp+sEFrolgprETo1NmUNyhxvZ69dFHDRS5r2wwPtdW1dODX4oAAa8u0NG8c=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJz2n/X6SMrm+WdDrb/d6+FTWIs+BSw0b7pelkXRd6Wuu9IzuU
	tIY68OObZT0qbvQZuq5DuabUEdr10bd66ktLS/qPWygzZs6wBgQmkZGJ1L4z6CAL80oAYSn+9SU
	LD+x2ShjU9BlUDswUM7+AjvaRnzOqMEA=
X-Gm-Gg: ASbGncvDlTcu8HJsjzW0zlP3v9xy6z1OKqGb21PzwYdCTiiuI0LMERBNANVCrGRSwez
	IYjeAI9eSVI+fKZbU0IOqPFSm3e1YmV5DU5wZlA6EU04OrABQZR4YWWTuBiSY7xs1YtQa09+SCI
	SFDWJGVfIlVLeDJh+wU3WRFyfxcE9/w7Fx5fjMheMxvtNyPTlngeF7hN27NbcUjgcYuD1nfGfM2
	3JhHMbPgBG5MUhlU2iNXjiJfg==
X-Google-Smtp-Source: AGHT+IFQERg8mTh7nax6OaWavJ8DgllCOHm5p0zLQR54uFFNlwqM0wGCA+Q/Rj/bdvDMe/rRbnhyAA7hAcefbtq0UHo=
X-Received: by 2002:a53:ca49:0:b0:633:a883:3d1b with SMTP id
 956f58d0204a3-63ccb87491emr6995599d50.6.1760069259733; Thu, 09 Oct 2025
 21:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250913003842.41944-1-safinaskar@gmail.com> <20250913003842.41944-29-safinaskar@gmail.com>
 <20250916030903.GA3598798-robh@kernel.org>
In-Reply-To: <20250916030903.GA3598798-robh@kernel.org>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:07:02 +0300
X-Gm-Features: AS18NWBct1j-7S8OHD6pljCYd2aEZxR7vcCRPjZz3T1pRcQcUgdDoCBWxEfbyM8
Message-ID: <CAPnZJGAvQirGTJTiTxumn8sAJ5KYDv8+MUTBmEW2fYX+r2RE3Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 28/62] init: alpha, arc, arm, arm64, csky, m68k,
 microblaze, mips, nios2, openrisc, parisc, powerpc, s390, sh, sparc, um, x86,
 xtensa: rename initrd_{start,end} to virt_external_initramfs_{start,end}
To: Rob Herring <robh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>, 
	Jens Axboe <axboe@kernel.dk>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Aleksa Sarai <cyphar@cyphar.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Julian Stecklina <julian.stecklina@cyberus-technology.de>, 
	Gao Xiang <hsiangkao@linux.alibaba.com>, Art Nikpal <email2tema@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Eric Curtin <ecurtin@redhat.com>, 
	Alexander Graf <graf@amazon.com>, Rob Landley <rob@landley.net>, 
	Lennart Poettering <mzxreary@0pointer.de>, linux-arch@vger.kernel.org, 
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

On Tue, Sep 16, 2025 at 6:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
> There's not really any point in listing every arch in the subject.

Ok, I will fix this.


--=20
Askar Safin
