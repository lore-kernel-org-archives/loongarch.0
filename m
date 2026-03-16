Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A2536F42A
	for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773699176; cv=pass; b=bF9d9PF1a1fIs40OzX4njC1MBL68huEFPXYUdlqs52ihsavWktG1pkE/ruM0TEe/lAr4vuSGt/R6Mr1LZ+IgNWYPxj982/DMwI1rHhoXkykxPiFMBXGNMQjz1JcGyV+fvcR1fsN1ErKPh6uKRV1n9ERK51E/LQ0ccGLWE30zs2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773699176; c=relaxed/simple;
	bh=rsp7Ihi8TSAj7hc2vakkxGqqL2oEkNH6XMA5zjqI1qA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h4FKCw5VhEMHa6PUIOIJjNJwqlLxez80XceKfXDTAaEGp+8qSiE3Bth6c42JGAobfcjnCpSO50tqi/3yZ92pqW+tLjtVM5ucI+7pRuzQgKW3ENIFVi7XHhsoX9tEBclCnJJx0olZt9iV7SCrV/4Z8yOWAMN9OhMxTwZGeWOlGUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRwRL18l; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRwRL18l"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6655469237aso2792433a12.0
        for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 15:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773699172; cv=none;
        d=google.com; s=arc-20240605;
        b=IoY+7EFKVi8XpbuJQf/tZm8HBE3qYveAFnzMawqxhlZUPRIfA4ktPYhdeKfL602I7L
         J8GhV2EZsvb0Ii/mA1S7zknrg4xVb4NmXtTEHO/i3s7JN1JsbNoHynU3hi9X4RsU5Lhe
         Pdwds/W3NHVGLJxAGBYSnosDeRbQ4Sd3ppIVmKYACL7wxtrGx3QEZ8HGBdXL6Cc0IKKg
         JtHjAiM9ZMHiLbv0L5v/cN14MrgxLNt+e8l1TcD5FayQqTabTQHEEasOm6xdmU5oYsjo
         oUA61JIBPzc3oohjJLsfjgQCXGazXUvKvo7I5gZNlcJ4aXN4ZC7MmCAV2NBIH6zgIEHI
         RSMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pAPcwDRyDaYRxv6m5ec0p6vencyIfyK+pU3obaup7wA=;
        fh=W7HrhxLz2L9rvQvHD1lil9KQmxanWqT//QdI5z3ZLWg=;
        b=AfWk81t47sff6N8WYK6Aogf+ulsfd8pmYiFBEdfeLQvye0ydrAoPLxieqieLQfE5jf
         WVw9vHEH1ZwKLeDxAoiXoaAvxEsZvetNZQVpGYHG6vYLXVv7nqnaodu26qEOB5he6QZe
         ewAFInppQhMtEn6wJaUp8wprdiPkYnRBueGHmpbrTcKJnudObbfe6mELoJ+jO8+VawRl
         wfD917OmH9mwyFaWKIIC9HbdzB8VJoUXd9xraI3EMSa6R4CZK/hr41dNTNRP6vagRjHk
         vLQb4wDgW5i31exxdm17WTb2iXlhfP5uJzVn4si5u7MtaRnP4AyfZY2u2hw+icDiH8Hu
         XL+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773699172; x=1774303972; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAPcwDRyDaYRxv6m5ec0p6vencyIfyK+pU3obaup7wA=;
        b=YRwRL18lnc7DcIi5Q3PT9LShLDgIDOFDRz+7cMUrrFbFkb6tfxiVz1D9k58D34Qp1I
         J/mO3ZDwgZ+6sxktWxo8ynpWCkpxvZOn4ftufoUZqBp3dV7aSN+7GwKTM1SfQZKsjSwR
         snoWmXTnRPeTFeVQj6bWMcV0GmaMYppRSS3lToyG+mzwyMNX1SkSVCKYUHvKB9jzsfDQ
         d3aCixko8rvqrzfYxgxvbcOgES343PvHgQ8J71Sk+aEkRD/cq1gbw2CH6bleN8KRbSKk
         6IHE13TYbenp7rceccyWs2QOf+BoJPJHZ7GD8v0MZsIjgs+vmP2fm3ru/VeJ1tFQ4Oi1
         T57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773699172; x=1774303972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pAPcwDRyDaYRxv6m5ec0p6vencyIfyK+pU3obaup7wA=;
        b=aK/A5GRoy0tjCLIKjynp1JGG4ECH1/F7LpqoK50UhshUM78ipxv7zVJogfmIUttcqi
         u5ZGaQvjpsSY5tIVkseVfY/dFccyfDVKX7ybSqWqMqhjfEk84k4HCoTiAyAKfufI9aPP
         kGMGvsUby3lkvrqwVURET6CPIZME686Rxg1mUp5m8ym0jrSw5Pblr/1D8VXeeTRa5zpf
         RcHddQMEvOc81RhQm8doj/pU43U8z2+80Y2AnYScrvCrA0FlRmFCQWxw7LpoqOQZFUkv
         K1pdaoVr5fn/j4u3Ur+5+ZsUlndq4EZ45cz7SHbm2tVXzBjxseRo6ezyyT/rPNoQWPHC
         p0Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUKnP9JdU5PtCPN8uWwH3u9nxikfU0L0rIDqMZx1XaNYrMY3AnQTX/WSSFkwmWGAZGJyGl1EUbc4iY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfPqikFrzR8QOLwPPDhp0Czalnxp9vgkyh/K/h75Gq3vXE/qw0
	zaajP8ocVkcab7hqy/J4rSqndCDCEF/R8zmk9/21Ry+Mbig7MOad5VnbOphvOo+QhAbUqi/sWkb
	VBzBEgdMU9xI94zzAkl2B3W8q5WM6qvc=
X-Gm-Gg: ATEYQzxPKEgtQCyG4IAQlMk2Sc/Y1HO8CWzGPJj1Sa+aKvRS5XLGEpIu2aB0XNUAElR
	3wfg/Zv860CpZNA7yPmCClQ08CaIRpN5cftJVwW9/snKSkwY9vEf9PilYEvOyKli0EO+a3rZSSN
	gldPEeBOJWgPa5F5Ur1hgi2BXuFrLYu/8dAc9xSnNMJ3yO6S+il4nW5L+HE8t84XCtYOZE6KEtr
	+sC73tfb4MiwgB7k+u8eOnhmJtVwPbaYhAuMQI9Nz5k3pvT/SM39oTQJ7x50HgjkD7zNx6SI/Sq
	mXIZsKv7je0fJzBXdoeoInr+jNkpWSxrb2XvONeV
X-Received: by 2002:a17:907:1c0b:b0:b97:b515:31e with SMTP id
 a640c23a62f3a-b97b51509acmr346111966b.50.1773699172087; Mon, 16 Mar 2026
 15:12:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311070416.972667-1-hch@lst.de> <20260311070416.972667-11-hch@lst.de>
In-Reply-To: <20260311070416.972667-11-hch@lst.de>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Mon, 16 Mar 2026 23:12:39 +0100
X-Gm-Features: AaiRm53MOL-S4iIRiZrnVZNNZCm-cfe6kMQGe2L4WL9TC_xpq_akeJ994p2lXMA
Message-ID: <CA+=Fv5QkJm8+ysx8W=ypr84oSR=rrikfk-iMMU6_xrtS1PsWvg@mail.gmail.com>
Subject: Re: [PATCH 10/27] alpha: move the XOR code to lib/raid/
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, 
	Li Nan <linan122@huawei.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:06=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> Move the optimized XOR code out of line into lib/raid.
>
> Note that the giant inline assembly block might be better off as a
> separate assembly source file now, but I'll leave that to the alpha
> maintainers.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/alpha/include/asm/xor.h | 853 +----------------------------------
>  lib/raid/xor/Makefile        |   2 +
>  lib/raid/xor/alpha/xor.c     | 849 ++++++++++++++++++++++++++++++++++
>  3 files changed, 855 insertions(+), 849 deletions(-)
>  create mode 100644 lib/raid/xor/alpha/xor.c
>

Hi,

I applied this patch and ran it on my UP2000+

The kernel builds and boots, and I verified the new lib/raid/xor/alpha
implementation using the XOR KUnit test, the test passed, see below:

[   25.705064]     KTAP version 1
[   25.705064]     # Subtest: xor
[   25.705064]     # module: xor_kunit
[   25.705064]     1..1
[   28.957992]     # xor_test: Test should be marked slow (runtime:
3.253413330s)
[   28.958969]     ok 1 xor_test

Acked-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
