Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375333C9
	for <loongarch@lists.linux.dev>; Sat,  2 Nov 2024 10:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730544434; cv=none; b=Zx0HOxLw1SGuMRQW3Ht+wBqCBD7qf3Et0desgt7asZW78VkClxDaBDQb6hDobhtFtOom1tt7xH4fSxqh63FRkHrxq5DREMQ2Ywlq34QTveYhssc1be3vOIVd56J/oJWCpWlbthBwVqmo7j+VGMbANuEdU6fv9ZuAWbcH1deIxe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730544434; c=relaxed/simple;
	bh=M7FdSpu+PhluM81llzaa2KRxqj+jubQ2BPx4TOrWNTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg6Xq0W1qNJ12Y2fafKQB8+qVRqg3tXpc+mw1cAekbqAGvJ8yMPG36s6CDexJGgCv6hLuDA+aPZOfbdo+cVc+Bulu1vd8dYAYDVrpVi4ZS5uRsWw87LGn784ziA+z5wFgr5cbDK4Mv0122zL9lvEd0KImS8lin5J+qzfP8ypuLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GETuJANe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GETuJANe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D391DC4CED5
	for <loongarch@lists.linux.dev>; Sat,  2 Nov 2024 10:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730544433;
	bh=M7FdSpu+PhluM81llzaa2KRxqj+jubQ2BPx4TOrWNTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GETuJANeH7gctgmH/+nyiGbLZgU60kn5uvKaHdxC3jOHXyMIY+5SIP3FVcC5h/4vv
	 2F7xHCEoHJS0lX3P7aD3ut8mIFSrFv0fHm6Op2JrumAUKGqrtpD0EWeTVv6BzOthLb
	 cOPP8GebgckiemWtQdsi6mBWqLiYHzeSWyMzb1zENPEsHy5Xv2w9L9UtNhAaMFqePl
	 DwhnDPyV/TgRCpycn4X3kpJ24lrXa/PI2ONFP7TokPIoc1Slpz4EGZ4aA86XjzMGou
	 SSLprHHgimxQ0kP5J6bxA4m+lTjGXKTj+ngmbOktZM9E/03kahXIaRmHD6mbHIg0BX
	 2ajJSBCd/ctBA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso25714121fa.2
        for <loongarch@lists.linux.dev>; Sat, 02 Nov 2024 03:47:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGZaqnxpTJ0ybqS0dGUiX8nXnj0fRocar2dar+JIDusQuog3jGC3lMGOwX5X6ozVdUYwFgedXkdN8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKYQqO2Nco2In68f4CYUuCxdb2xdjfJQWaLNdY2+/1Am1MQxkL
	tEWeWuv9nJh1hkaIz7yIVtVmowTP6zTMy3jXBigcwTB4BD37xLySOgqnBruzLMe+TJLwbDzAUBs
	a+xFlALBfNQcOSJ+OnN+Ves6MLBQ=
X-Google-Smtp-Source: AGHT+IH0WCZimX1F/VX+DWohj1qqHgkCvV1OEM1qu/eyPpSjntB2c2S/MHD4wvbHvrBfL9ia8YhfUT4VBcWPbilaETQ=
X-Received: by 2002:a05:651c:506:b0:2fb:4603:da13 with SMTP id
 38308e7fff4ca-2fcbe0989bfmr124544811fa.39.1730544432162; Sat, 02 Nov 2024
 03:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com> <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
In-Reply-To: <ZyX8yEqnjXjJ5itO@gondor.apana.org.au>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 11:46:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
Message-ID: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Nov 2024 at 11:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
> >
> > At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
> > sha) via the shash API.
>
> OK, given that btrfs is still doing this, I think we should still
> register crc32c-arch conditionally.  Having it point to crc32c-generic
> is just confusing (at least if you use btrfs).
>

Agreed. So we should take this patch.

The current issue with btrfs is that it will misidentify
crc32c-generic on arm64 as being 'slow', but this was already fixed by
my patches that are already in cryptodev.

On arm64, crc32 instructions are always available (the only known
micro-architecture that omitted them has been obsolete for years), and
on x86_64 the situation is similar in practice (introduced in SSE
4.2), and so this patch changes very little for the majority of btrfs
users.

But on architectures such as 32-bit ARM, where these instructions are
only available if you are booting a 32-bit kernel on a 64-bit CPU
(which is more common than you might think), this patch will ensure
that crc32-arm / crc32c-arm are only registered if the instructions
are actually available, and btrfs will take the slow async patch for
checksumming if they are not. (I seriously doubt that btrfs on 32-bit
ARM is a thing but who knows)
