Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EB23EB11C
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038461; cv=none; b=MyJrI4LCyUJrNd40s5RrPv68Yo6yjVusA3QXg4JPJWg4k7nfXM266jCCzD1N5XSjakJd3kfoKGTy6ogmyRVdFGWxAzWxF6br9YUWVN5ztulukU5WCUjXNrYfQWWgYwKwxpjf1KjF6OVlf5a0sO+VZtJRM8jKI+PJso8DI8F0K9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038461; c=relaxed/simple;
	bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=cQumcMWko5afgGdHqkF90woYuV8vD5citct0ASyTFgmeziq6zg9couXUu6NVth7w4P3XptPopM7N+2a/0GZdg5MlG9Irmg3gqZfBLAFQpyhwFq1QJBLPb2xnYWLrUXr1phAmqn6i0TY4aRWHqEHJtB7Is5zU4L9ZOpYuccrUw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvtHzH49; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvtHzH49"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so5822670a91.0
        for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038458; x=1789643258; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=qvtHzH49IpgVHGwxU6NgmtAYuseev/bySb6Apa3CaoWPwNHz2JsxHAY3rgKbRg5vcc
         QeukSy/7mS32UfAcTqPxVN0pA5/0w39PKNvl5Gt76XGYklOZPmqQ2vZXZ7IwWVTcFOw8
         giHIvjVLu3fEnop0UY5wVh6mYwPQkgNzS6p9s6kafgJD1MidTO6HIiNsNo5cECC8Urjm
         OVAiHYE56281SkwnKAH3tEtSQ+n5eWXgADEqxR6xefMMRFF0i47A51zipELsiHnV1F/7
         zwdq2c/wpojvTisKIdAcxhgJD6mLQ6pKspT+k+MsHz9QZnHob7czhv6U/qLMjLUhz67M
         i3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038458; x=1789643258;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70Xrz5Ek18W9RLHK+PGrZl6neyZSU/LQLxpuqNmBXms=;
        b=CiNFP0Q2YrkVvuHwwZLibNpheESNM4b17OpZRihI8DpqfyIV+NKKA6/JjEQkQq4xZA
         aXtaCg2/7uj2CRzhx6Qhp+S/pQabHsng7+oz+ntwxeEFp7FnACE8AN5S8lmrC7wLuGVO
         akHV/BF4nX+9vzdz06ylcJgWWBDVfQ+MG/rwO/2sOefBmrquTLVh8B+mcdN2kOuVb4HP
         XrrFYk/Kz6M0DSDraIumRNejHg+YnIkiTXZZpBAB22+vhUZBvDyvFX9g3Qe2B48LF9Ts
         3UrxLEWH8w6DlOB6dCVWng4eq9bDM0sphVtG+96JVvHZVVHzYKxm948s9MjZZ+wni7xN
         roKg==
X-Forwarded-Encrypted: i=1; AKwUvBy7ZIgGqGpKw54gpQwdBedkFzpSGMp7qfeAwjxw6J7Hn69BfqWYaF5hpdDuSlOS8F8zHRuX7baq06A=@lists.linux.dev
X-Gm-Message-State: AFuF++k2oFtWxyXsyl2fC1SdKF5HksRFQK4MoMrfCIstNAayq+ZFaZ7w
	23zbbwhE/85lyNpV+tDBtSBjqIFUJs6hP8Fzz4BqV82OWljOB2UyS2dx
X-Gm-Gg: AYBFou0uUo2WJZmdDH+RI/Kch20vUoaoNk9SLqYN6zlmQaxKPybtpwRSLTh6ISqFsFR
	8d3neVpj3gP2Oz2gEFF6iHB6V0gU05MWP9OFK2m30kpwcwzq74yRMZYAU3HFiAw8zFOH40e/Zgg
	f23Fca5EGnjOtgWv/GSW+3Rn/Tv/kMTBokYlOkpW2UgfPJXBZ+xeZ20PE8l+p0Qx3COO4yQpHBk
	1SvtelDY6VHVVqbn8cI7ByjTbuI4XXVPSCOUAVjxVS9uyehg6O07T6CGesXFEKnsea/hSjFIWzm
	D0X53p5ZbLnt3VMT6+/oVQrd2AHHu/dz+HkbUD1LTDY2u1Y3OlyRgUN94m3b0RI0LpwOPnACo/K
	mhxl+F9R/MkWYGBhLHdrSufc4YO19AgZHypBsRb7jx5TRrqiUYtg4rtz+zuBOlJ5cUSI9ZFLOKx
	TXGCHzhqqhJIRuMcQZ4qi6mmUjRLfBZ4NagN1dYjN6UbAILow5cQxk83A3s9DKa1caykoT2AC6j
	mwzIHj1oLTtFNlvdXpCEW+ZSvJydS9PAo26a8Hw+Hs1+6/11lb6j8A=
X-Received: by 2002:a17:90b:1b06:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-39b2622ba26mr58218547a91.19.1789038457819;
        Thu, 10 Sep 2026 04:07:37 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm43023781eec.6.2026.09.10.04.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:07:36 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 10/20] KVM: selftests: Add a wrapper API to allocate multiple page table pages
In-Reply-To: <20260902164123.2546762-11-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:34:41 +0530
Message-ID: <8q591i5y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-11-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Add vm_alloc_page_table_pages() and use it throughout arch code to replace
> open coded equivalents.
>
> No functional change intended.
>

Straight forward change. LGTM.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

