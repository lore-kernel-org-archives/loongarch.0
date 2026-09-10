Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9683CAA59
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 06:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022334; cv=none; b=ROQwW15NQSWvORvHsGK0yhX35TNFBpWvO+fEnc4AS8dC/J7LOac0b0m8Ny5UJxL64xAeW4SvxW7mpzxfyFcMMLPaDwtysddjnEa1vGAofC6KK8SeDgvYfX0lDxFHrbUM/Kwc6M+XyT0IZpIndZJDT7R3QKP4G0D2nISwdJGCNdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022334; c=relaxed/simple;
	bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=j5C9ddthTrlAOImwEt9Y9cgoKgWjoReozngPS+T0Gy0qFUkcTV4vXcGi6mvj4m+cF0KC2fVyaBWhM+zq55+5mWdu4HtcYbicnBkSxmQ7pwRra9Hp0BcBEsNZ48vjXARxhhRfRM5txz52zrEqRqreYWyisYkrjngpsxq/0vCHY1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9eRCiSR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9eRCiSR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso8004555a91.1
        for <loongarch@lists.linux.dev>; Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022332; x=1789627132; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=q9eRCiSRfxIQVl9pX7KDjwiJQ1+/OG9r5mWhSR2Tv0Svp6vRXUQf+xsXwq5ecDiIiC
         hv9mGnuXXHSDN7OojfWzVCrXATuG+T9M69GTYNNnFnRc/dMsKOg0n8xpQVq3h5/V6zED
         NwiHOKZDFHidgUiVdX/QXSbbZijXUt2cbtZ8EU1y+YzdxlvfWZxYmpLV20xzANqV+Kvy
         BBjVkspBOyNXNguezKq9Pfdiy+oYI9EPrjjdSqICIgR5hEFpRu/M7BwkBf+E/4JyLqRB
         R2Wp+m2sQ7tXoA8IbCKA6fh7BUPn8dbzsmvHtIwEhLHmHIBj9Pvj63ccy//JHbPcDnG5
         W2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022332; x=1789627132;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TP/7+E4rrU+pDYrVqTFosm4KeNM9JoqKXMfQYJNgxAE=;
        b=DhdWXcpRpK27JpARbi8kuZr62QWZ/AdUbBxwcBf99qm1HvBn8lLLmnM1BAsQksQMJN
         JOyyNT4SouemamNdpJhGUqlpWGuncTqSZXLKxDrytSXJ4kd8KYRlmQ39mkNFkgo61352
         /9Pdo51mPkaryFea49Ty3LQfYaRtQIGUkhCxqBzG/ycTHrQsusNv1X1SnBcNflWPDday
         3bA8QAoEd8XDor4y48es+C6V/nN0ZSdeQ/yLjmzQZoBPBvdOSmzEtGFL0ZObHWTFUEmZ
         QLCVC0hvy/wtbVKU9hp5EYfo2ScwoIae8Gopdlci80t80hHGpN3e2iLZh1hUOTYoyJ1M
         RfuA==
X-Forwarded-Encrypted: i=1; AKwUvBxB6H4PluMJt8IsQQIXEgrSTQnYMETU8/RGvjONI53FB+lz1wucSmrufQ6eT4pAes/7vwoCJ/gMwXo=@lists.linux.dev
X-Gm-Message-State: AFuF++nNkVuG7h6CYZkQM864glOX/2ng/Fkya9H9ltiOQmQ+1fgOfIOk
	YS5dYWOkfZPVMmmADoAyQRH78+JTjaLDd79JcL0FQYYT24+9fGsy4plQ
X-Gm-Gg: AYBFou0Vu6gqB9fWTU4GSMbmjXBhC7fcjPxptMg/cEQmH8jTvujN9tAo3FUls2xGeZL
	U9e8kHVqza/HAxRT0SlzsYmRpbHhmEQUWaJaFopwYexM/f7of2VcKoGE715WqN5ErKI0E6z0tid
	vmS1iB8LeK6S02u+69x+F6bc/+zXXTWQcgnwInchXiQkriJz/u8biLNydpNyFWTLilTtkxES67L
	UfIxm8n7til7HVOgt638dgmYphT+13QxJ8+9WtASOFxdtrr3D1HcYLPmsgcXS1EWOthLFnxGByo
	iQj6u0k2aGxgsV13CA7nxT7zff7AhHtIUN5kap9+twQOWsOx/ci4zZlVs10AE32B5Nq07iSJsBH
	IrMGcy+4KvEEzaMUAHGflt/CbOZYQ8N5HcFA2BIpUhUFdsdwkB33NyBN0mvbMgtNz027qrp+CGl
	200kx2EnKY0mXDQuC9IMES4e4Jpm7dCfaXHO3OJzNAeL4Fr6u7IfvCIjo/Sz5q0FMvv5D8DCiL9
	Z0SQ5HAzD8/MszCVGopX7JqAp9c6q6b2TyE+ubMLGxZpU58e8g+gCOLf6hubjoczA==
X-Received: by 2002:a17:90a:2c9:b0:39b:2b5a:8dc5 with SMTP id 98e67ed59e1d1-39b2b5a9b24mr38222127a91.6.1789022332072;
        Wed, 09 Sep 2026 23:38:52 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33987ccf483sm10464300eec.20.2026.09.09.23.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:38:51 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 07/20] KVM: selftests: Make the single-page allocator APIs static inline
In-Reply-To: <20260902164123.2546762-8-seanjc@google.com>
Date: Thu, 10 Sep 2026 12:06:11 +0530
Message-ID: <ecf11ulg.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-8-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Move the single-page allocator APIs to kvm_util.h as inline functions, as
> the are trivial wrappers, and unlike __vm_phy_pages_alloc(), are expected
> to remain that way for the foreseeable future.
>
> No functional change intended.
>
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
