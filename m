Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815930;
	b=Qp4D+VNxNViGmnhWKYhMpST2tpeHy3rea4soWXBGHN+Ga23UByfgleqCre9kFRmv2l8+
	 0Yrb6lsVL8FnbInshtO8ahT3+kzJYxXdMVrpcZho9hAkQM3kaytIINRTLs0IsefGrvqTL
	 PX5rFJw/OhRWIxDmuYZIiZstHM1cHRappv1yctU62OEt4ZvkPgLAvEkMkhTHYyBj3IS6g
	 Td6F+FlBAP/YQNLkduC8GYF087RaCqx/8NC8pG9N885BQFyRNRpGY+9tCP9cCDqMAzY+M
	 /tT4BtU20BpFgRD818mZSv05e9u/tkyKH2IGntpk0da0mzQU0VwUHFU3xAzEK77NILg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
	b=3avg6VQNLbv/L4TUcsydx2i5KH4SXqn4K71l76w8hXg4dWTFoCTGpjG4ja2BC7+ObNDX
	 cmD1jcrChlGwui5582WcP8L7RUQR3b1CG2CYHGhktK/Kptk840wdv/AvOCjUvI8Bv/TKg
	 bR5FLJYJcKNFANyNbmVq00I+hzTtjoBAUGPcBdvsIaaIxHfbRfwgVgURo1T1qE6WOnlBh
	 NT8mElKm90LYrIgaKSpSoFU81/izkAraBbtkHX67Gv2RHkshtfqxPHyxVLYpzKQzyL4b6
	 LfMJqe4nnD31mj497zWSVKdZ1kVo+TEhZ9jBYutzazxCbNXYZmlZ2YXerajR6GPxZYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FQOlk2aJ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6D9606A31C
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 07:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB6D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FQOlk2aJ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso19959745e9.0
        for <loongarch@lists.linux.dev>; Sun, 15 Nov 2026 23:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815928; x=1795420728; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=FQOlk2aJWb/jcKlNLpe/ofT8Me8EHvxwBTmskys6FSalUlaJGB5mlg88c63xgaQBCT
         LPWdIUGH1G3fMw+FIufVaCLCV+JmLET8fiQAPI8C8LRelduoBA3y90SrakgvqsN5QTEc
         Jr6VIqkPl48YX9dq6tra6PnW/LoUD73QGXrRUKz4eEhQRBpr/d91Ih3GpfE2C0cg8tFu
         lofBn4gam+Ba9JtH5QxxmH9UmS+lJ3Gvq2lZA8EYQv91801E69m2o+vAezNQj44aPmrL
         wvvVIqdoxHSKGqzq9Ab4OyL8qnIfzEAfw4kXzAcIrYQia8Nt5sw/JL7WC7YGdT7t03A7
         QQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815928; x=1795420728;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=sv/JL2fKqFbhDLHW9N0BoRyYZV03y/nE5nEBgCRZnGlINmA2eO4++oH7KL8+oYYY+w
         U1aAdo4x+VgRSB4d/dB3v57zKAkqebAdv/2wkGBnuhyANS0LWnri3VV54TI+I3ArI747
         N0pfSwTQHlKAiYVqCsAQUx/Uh8tQ6l8nPB1cv9h1yTuxoTlq32Sam4YwVeTP/wmL+99G
         p88MJVuo0aG6qWVbMrwTWFm95ZJN78VCe+fq1F9gO8zFmVSBrIN/pcjjZehzuOeZ8CSj
         35dJR09XKvKgDembnhsI/+w5SBc6Pm1Sm95BPIRUb3MIf4H17KtT62dtTHL1B36VUT4Y
         Omiw==
X-Forwarded-Encrypted: i=1; AL+hErFFeb9IdUl500qVBwph4a/aELrpTZ8fMx39rFt1qWoARhrBHMvRp5UYhphNZOGMOpMi7Osyi1Id8H8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8HSQT58fbC2GUiDiM1+CVqOiju2TGkUw4HKc4t/rlDRmVX3QfG
	YsGFYvf7EqhIr0qH8bLrSKQwvtTNnSRyYA10sNKKmHSTwM94t8Rcb0UzwIHnmfjVFyd7
X-Gm-Gg: AYBFou1bBp8n7UBrR++Bvd6Hli+6vKZ2/oKr4h3KGdgU4/WcR6nyh7mYK3ds0zN4w+l
	WWpxRpr4F/qnfKcthJKmIbltQf4Irqh2FcyiGZnuiAuBUWRr4H1A5aHf7BxmBfiDh5Re+Itnjoa
	/AMRAR+l0c8hlKMxNIGunGoxaEZnf/UYF2chkyL6pN3RoY3kJCOedeDuZskD1QFnlDHs+0b95hV
	e/h8zqLivFv/RdrKDvO6IE6LxW0oFLvEaUiG5iIOCpMLAtTmI0rI2QfuaeGaHBBgLxlSsjCBRzT
	fULuOauEBno9qoQh5qFqa9RB0qCmCpu3R58VZ9V/rPmJnSUjdy9PnVozvnPDqMn69YIvfy7HQJE
	O2/fc7bFjfppI8ElVxEFLt+OACk7toSqe2sA75WIJO1xDJTYpxRRirwktJUfqn0iQMulNHp2lRO
	jQwpabVmLR2h2sVTWG4SxKBXtn2oVEvw1uHbNjaXZh8gl12lhE8nB7wPlRnewS3yXoqiMen6Bg1
	nTSJFTUGVgijgWRhJe6wi29WDjgA42dUm1J7oILVlTv2xdTfUBT90ERDQ6RgpPaWAnUU57sKH8w
	7VlgnflGV/pNvMAnf+oaCLIyFGcXuZrxsRaJ0iFGrO5relp4qqGhWgUu/cxw9RM=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr172834365e9.1.1794815928232;
        Sun, 15 Nov 2026 23:58:48 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm375768305e9.2.2026.11.15.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:47 -0800 (PST)
Message-ID: <aa32167cd3865049bfe0281b8b651c47f5e1c05d.camel@amutable.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:46 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-12 at 17:37 +0100, Christian Brauner wrote:
> copy_oldmem_page() maps a page of the old kernel with ioremap() and
> copies from it without checking whether the mapping worked. If it
> didn't, the copy reads from an offset into the NULL page.
>=20
> Return -ENOMEM like the other architectures do. read_from_oldmem()
> turns
> that into -EFAULT like any other short copy.
>=20
> Fixes: 4d5ade5b29c6 ("sh: kdump support.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0arch/sh/kernel/crash_dump.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/arch/sh/kernel/crash_dump.c
> b/arch/sh/kernel/crash_dump.c
> index 19ce6a950aaca..85c0e58f1a59f 100644
> --- a/arch/sh/kernel/crash_dump.c
> +++ b/arch/sh/kernel/crash_dump.c
> @@ -20,6 +20,9 @@ ssize_t copy_oldmem_page(struct iov_iter *iter,
> unsigned long pfn,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	vaddr =3D ioremap(pfn << PAGE_SHIFT, PAGE_SIZE);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> =C2=A0	csize =3D copy_to_iter(vaddr + offset, csize, iter);
> =C2=A0	iounmap(vaddr);
> =C2=A0
