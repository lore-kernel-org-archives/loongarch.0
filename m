Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CE73D3D11
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 06:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022086; cv=none; b=jb0iHZbyn15PQVx6Ajrk1RkhFWR7TL5v2e3aiMIspKyMJci34D9QEL0zEROezeGQXfQrjecZvsUqwFwaGogCpg7pM79ufP5vt6axhXohkdUuUwpc4MPAvXtTLJcM99bV9Y+Ing93XiQsy+W5cbyZJu8BbZFzi7uVsMBL5/tuQrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022086; c=relaxed/simple;
	bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=DDFEoXGG8VI1UKg6d1XkJEUP/H8EQVgfnRVP+UUMDrj79OsHnrmFYh8iNxqIIsHiqrw3XgA1ZW1Ov1g5Ih+7SiaHtr9NJTo2bkJsnH5qL5AQt1IW1qe1M0p7AHKJ0HZ5XdFX4qXJjis9WS0diinmaG5huwHGo786Nc8kURB0Jj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljf8Neax; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljf8Neax"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-382ef647e20so7317425a91.1
        for <loongarch@lists.linux.dev>; Wed, 09 Sep 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022084; x=1789626884; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=ljf8NeaxmI96j1nmck4WiEDv41LOtZZcp0WLTLcpPiWVr1lcf5vjc1H8hbgMsUMR+r
         VLsBPFpRoGr4K3DLeQsUNyGXV7e7N9wUWdMkH84MPzcSP8zktdz7D4BqO1+4KxHjkczj
         kUUgDS8+5V+kr3m7WOH4wyp4d3XWvpHeQtpx+4hVmwcQ5siShHOKvidQ5Pfv+CdZGQe2
         9khhCT9oqAi5DAve5Jw/8ejjUkgLZui467/3q1kY1nx4VXlDgTmcN7xQjmbJbn5D2qtG
         VMIV2aHFzMebZYTWdQgNqfalSaJMiB7LhgvLCFULtIvqfqf1rsRuFOKcT2wQRbHLQp9U
         vBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022084; x=1789626884;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/uaCqa1UBzrB4l/x0ktWW2Ji3uA4tmOrYEYh+8w3GLM=;
        b=o2B6pbrtCqnRVQY+RePRNamE0jTqOfTO3GJKxjRh87qIMZggeilYL/UHBQExi0ecdK
         KIRxBOs4iQNABkcLIQGpTKIKffB+EFuZ7dnFmwJCMTChSszsSFyuu/yJ+LC7uwRk6viW
         GQIEw/X+HYal58LsWS7biXw5ev/0U0FFd9QpWpS0uwe11/Uds2t4/+HsTpcsH9SnK0aw
         Q/Z0l6OnX5qpBNWa3T3xHlysJTvuMSmpzMpUYgVpoy/djS6PrB4Uj6WUzPC5SCBF2Uw9
         UYqeuhoVWxtsY0Q+RoWEXsziWdc5kOmTOFaMB48WgNZw0zobqZQK/u0XGgrgG0APqBRa
         xTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJYDqvYUagN64HFq8tHI2REn3Id0dltEfA5K/41px4XeybQMaLePRziV09uWrrbUUA4EnFenPoRao=@lists.linux.dev
X-Gm-Message-State: AFuF++nj7wIP0z9SMsTXVBPg4g/oOacFt8tmfgGdk9CAYu3fLWXlJi2r
	CNOO2rBznuxwpgAz2k6syLn3fBfpiQJW8raG/wFMa8PMQfcnbbKR86It
X-Gm-Gg: AYBFou3DAB2pCI25cgB9oA2ChHXf5IsjtJpYj3EBjbCTBEc4nraXTBzZZ+A92jJw4/z
	P/jTqTdxTAOD2g33Utc1I0Ks0WCh/HRJOxKB1AjtbpbQGTChOPrAYAe6B+1vS/bQ3x9l/GOTkm4
	qjFGupmHubDjFLS4PiCXbyqL0gvAVthm9UcecVNyEpbsPgccvxo+PCGvb8OwC6f8GLXaBdkRws2
	22WVVK0VUwCGM6bfczMb0L/8Af8VXC4S0fhdrD3/IfbxfKOGeR7Nb/VxLY3aoyY7uMzBDtOTdLe
	FslFiDTcanSAjUnzALIp0Qex65f6JLjZzowx7RvEoUhF0gRFG6OHXoCzIlWAM6o59oJF1Knj1ox
	h8SplksRWGFAWGz3XjxYFFA8NB73IBA/JIYt4Mjb7SADtOzp817SZjdHt2U46FcWW81xSxLT7lo
	Ajbc0YGVJF8G/5enQGF8IgEiUl7KcUzk57ddzh7oA4bKp8Z7wjgKzioXFUG0UiwulJaWW9HqixX
	xxgQDECdgFoeDDHKxrg0aErjzT6oOZLIy9sYeTG+OW9WSQELEijreA=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr57429977a91.1.1789022083690;
        Wed, 09 Sep 2026 23:34:43 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10434389eec.20.2026.09.09.23.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:42 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/20] KVM: selftests: Extend page allocator to support naturally aligned allocations
In-Reply-To: <20260902164123.2546762-7-seanjc@google.com>
Date: Thu, 10 Sep 2026 10:57:06 +0530
Message-ID: <fqzh1xsl.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-7-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Extend the page allocator to support naturally aligned allocations, as some
> flavors of PowerPC page tables require multiple guest pages per table, and
> those tables need to be naturally aligned.
>

That's true.

> Take care to align the potential base address *inside* the retry loop, i.e.
> the base needs to be (re)aligned on every attempt.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Thanks for sharing the changes. Looks good to me.

Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
