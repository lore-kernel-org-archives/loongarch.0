Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BC722259C
	for <loongarch@lists.linux.dev>; Mon,  9 Jun 2025 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749508613; cv=none; b=PIK1XmR3XwX8Uyy69aGFIfidgudEslyPYEiE2czyxVWBj5wDdGyMmv4J6dHssyaheFeY4LrcTlAKoe90mEdoGD55nfIcOmpozZbrB3Cf4CufZQYot7386kyl+ZsnDG5HX5zRsAkDKBL6OdNrhdV2U8DfR06PJ0olsY7mDbr4Gxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749508613; c=relaxed/simple;
	bh=zDKYNbdF0rH3+FimkZczocsoz+9nXxDjaYj98TTwVZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xi7LItcGrdh5Q+bd9ERJdyjW4Aw0QigJZyl1BAn9N0U2/PUBYKWf/ekzgQauwQ5Om2twOcwSsXnaxdvbx0BB83Hr1PsforDTetqzdIN3vZSEGoAp/XNNU/ahdJbznTrBD+dzctbvYjFX4Rm4wvUM8ERCc5G5XYJb3MKYNIPL+2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvLYrgKo; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvLYrgKo"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a43972dcd7so63305661cf.3
        for <loongarch@lists.linux.dev>; Mon, 09 Jun 2025 15:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749508610; x=1750113410; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=hvLYrgKor4kVWJ8AxJf7GIs81S4LYIisDpiUfRqayrB6kfSNfHn/81aGlhfQPmyqUR
         gIx06FFOgFow0TzjCPFkRTZ8Vg3XwI5bYBkQb4iYjXRb7yc/lICZsQynwslC/1qlY/zb
         bSxsiAi7pZy4hh3iSE3iKqLhtivQuliHbXovXSqPW+Mr4GbmfqwL1kZjkhmrNO6IEyvF
         N0PK1jUsnjxgtnKwKp+8J3XGyHF6pIpLysVKSe2kw5ua4RhMI66aAw5WwmtCGrV4WSy5
         DBMMq3JHzYpNdryHB3nKJWnmAaukMNZQnD50KpcoAxChu/tHRjjPEJqcpkYD6zqUtXXg
         PUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749508610; x=1750113410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hq0btBK5TQK/jQfASAZ7ArH/Py2u4qhWqQQYIBxtEI=;
        b=jJ9zTGXvNp8fgxAaaRdrznn3Af26vSScZhM4S3HCuz70Qyeti0bnPL8GvZpgfDyLqV
         VGFwk5W5tA8VAaHD9kuNu6zujYpERGRtzM5Lx4ot7kxPJyC/cualzFYP9a6fIfehYeVL
         qfYV5TBVjs5GeGRZRT/U0dj7G/2NmTBh46ALMuxdb6QOkDgtpA1uGFs0R9RdfGtZAQgT
         3VS+UVzgmDbKW2cvXXDxUnHKkbzwm6Xr9qdqiUnhhBZhZbuqEFlM7LT6THmjlm23MYFl
         rMF+MyjppvGINNFItSjXaOHXre//FjfUff4BxtRqHNFJfTWKJODTAcc2rv9/t+XD1J5a
         vxvw==
X-Forwarded-Encrypted: i=1; AJvYcCUE8RRbwKLd6/704If3nLEb1w7WEiIgXJT9R1OgBoF8oaa0aVuiJkR8pGOlg7WuEqwk/evvgaDSrEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YysvS+vhJz/P7EL77/Bxfh3/nUkVc5r1sh2AM0Uvema2zdowj+W
	hDNMKepJc1VX/fxzF3ohQVgHRsle6fNBcW6yipBenqRgAw5kQmCo+tw5OY4qDqkGNhBZyf5Fb39
	BXPER0XygDQGVEzItO3EMFdMcV0CaD9k=
X-Gm-Gg: ASbGncs2hmDTytms96dFwWKe0hhTm4uIoq9WtxRRUkqotxKxqfKb9FcSFF8LstJvOy+
	sug4romse8CQSb9tYGE0lGylRaH4LiSSCxl/s+74oCNRWp0IKmJ1I7/nO4OXNOono9Km5bB2eW0
	mUgjTJjs0iMyuHbOzw61rfVWuX8AzobhThAZNyYNPI334=
X-Google-Smtp-Source: AGHT+IEs8tHro3Bqg7q8bk+joLEpnvyUJ+PSWmsKZZ858+7uklxqykPVE6FCaw1PpU8qCZAfdipBs10XMfJUvah5VmA=
X-Received: by 2002:a05:6214:f2a:b0:6fa:f94e:6e75 with SMTP id
 6a1803df08f44-6fb08f5f7c4mr277251346d6.25.1749508610272; Mon, 09 Jun 2025
 15:36:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250607200454.73587-1-ebiggers@kernel.org> <CAGRGNgV_4X3O-qo3XFGexi9_JqJXK9Mf82=p8CQ4BoD3o-Hypw@mail.gmail.com>
 <20250609194845.GC1255@sol>
In-Reply-To: <20250609194845.GC1255@sol>
From: Julian Calaby <julian.calaby@gmail.com>
Date: Tue, 10 Jun 2025 08:36:39 +1000
X-Gm-Features: AX0GCFuUtzPWjE_fUMffnG3t-eGyXruP1OclUqP-Gat86eROO8R2ly8lc5p3jN0
Message-ID: <CAGRGNgXw5LcykjiRS3yteb0K8FmYtb9wp1CJPM+GCKAw7j4ktQ@mail.gmail.com>
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

On Tue, Jun 10, 2025 at 5:49=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Mon, Jun 09, 2025 at 06:15:24PM +1000, Julian Calaby wrote:
> > Hi Eric,
> >
> > On Sun, Jun 8, 2025 at 6:07=E2=80=AFAM Eric Biggers <ebiggers@kernel.or=
g> wrote:
> > >
> > > This series is also available at:
> > >
> > >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebigger=
s/linux.git lib-crc-arch-v2
> > >
> > > This series improves how lib/crc supports arch-optimized code.  First=
,
> > > instead of the arch-optimized CRC code being in arch/$(SRCARCH)/lib/,=
 it
> > > will now be in lib/crc/$(SRCARCH)/.  Second, the API functions (e.g.
> > > crc32c()), arch-optimized functions (e.g. crc32c_arch()), and generic
> > > functions (e.g. crc32c_base()) will now be part of a single module fo=
r
> > > each CRC type, allowing better inlining and dead code elimination.  T=
he
> > > second change is made possible by the first.
> > >
> > > As an example, consider CONFIG_CRC32=3Dm on x86.  We'll now have just
> > > crc32.ko instead of both crc32-x86.ko and crc32.ko.  The two modules
> > > were already coupled together and always both got loaded together via
> > > direct symbol dependency, so the separation provided no benefit.
> > >
> > > Note: later I'd like to apply the same design to lib/crypto/ too, whe=
re
> > > often the API functions are out-of-line so this will work even better=
.
> > > In those cases, for each algorithm we currently have 3 modules all
> > > coupled together, e.g. libsha256.ko, libsha256-generic.ko, and
> > > sha256-x86.ko.  We should have just one, inline things properly, and
> > > rely on the compiler's dead code elimination to decide the inclusion =
of
> > > the generic code instead of manually setting it via kconfig.
> > >
> > > Having arch-specific code outside arch/ was somewhat controversial wh=
en
> > > Zinc proposed it back in 2018.  But I don't think the concerns are
> > > warranted.  It's better from a technical perspective, as it enables t=
he
> > > improvements mentioned above.  This model is already successfully use=
d
> > > in other places in the kernel such as lib/raid6/.  The community of e=
ach
> > > architecture still remains free to work on the code, even if it's not=
 in
> > > arch/.  At the time there was also a desire to put the library code i=
n
> > > the same files as the old-school crypto API, but that was a mistake; =
now
> > > that the library is separate, that's no longer a constraint either.
> >
> > Quick question, and apologies if this has been covered elsewhere.
> >
> > Why not just use choice blocks in Kconfig to choose the compiled-in
> > crc32 variant instead of this somewhat indirect scheme?
> >
> > This would keep the dependencies grouped by arch and provide a single p=
lace to
> > choose whether the generic or arch-specific method is used.
>
> It's not clear exactly what you're suggesting, but it sounds like you're
> complaining about this:
>
>     config CRC32_ARCH
>             bool
>             depends on CRC32 && CRC_OPTIMIZATIONS
>             default y if ARM && KERNEL_MODE_NEON
>             default y if ARM64
>             default y if LOONGARCH
>             default y if MIPS && CPU_MIPSR6
>             default y if PPC64 && ALTIVEC
>             default y if RISCV && RISCV_ISA_ZBC
>             default y if S390
>             default y if SPARC64
>             default y if X86

I was suggesting something roughly like:

choice
    prompt "CRC32 Variant"
    depends on CRC32 && CRC_OPTIMIZATIONS

config CRC32_ARCH_ARM_NEON
    bool "ARM NEON"
    default y
    depends ARM && KERNEL_MODE_NEON

...

config CRC32_GENERIC
    bool "Generic"

endchoice

> This patchset strikes a balance where the vast majority of the arch-speci=
fic CRC
> code is isolated in lib/crc/$(SRCARCH), and the exceptions are just
> lib/crc/Makefile and lib/crc/Kconfig.  I think these exceptions make sens=
e,
> given that we're building a single module per CRC variant.  We'd have to =
go
> through some hoops to isolate the arch-specific Kconfig and Makefile snip=
pets
> into per-arch files, which don't seem worth it here IMO.

I was only really concerned with the Kconfig structure, I was
expecting Kbuild to look roughly like this: (filenames are wrong)

crc32-y +=3D crc32-base.o
crc32-$(CRC32_ARCH_ARM_NEON) +=3D arch/arm/crc32-neon.o
...
crc32-$(CRC32_GENERIC) +=3D crc32-generic.o

but yeah, your proposal here has grown on me now that I think about it
and the only real "benefit" mine has is that architectures can display
choices for variants that have Kconfig-visible requirements, which
probably isn't that many so it wouldn't be useful in practice.

Thanks for answering my question,

--=20
Julian Calaby

Email: julian.calaby@gmail.com
Profile: http://www.google.com/profiles/julian.calaby/
