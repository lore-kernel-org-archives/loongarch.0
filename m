Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31AA2DCF74
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038010; cv=none; b=BSl8mqgbQtX0VjDcwzslojEpw1eNhLwEdop40kI0+lzRboZ4n1S8PlmxfUTT0CD00J7VEwcGHeYhuAbBJ5kSIuW0wzy+3+ZgaYrGoqMYQ2kN9yxDlE6rFbNLBfIoPIj4rH9PO6sIoitW3RlZAgbtRu3RA1FmC8Sx8zoocNxVclE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038010; c=relaxed/simple;
	bh=UDzFuqayMptXRxyD0sVNI7x/dzCA7DIHFk14h2KsjfE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=O1clgqQ1wQbldBwgMXysjMMHWoEm8q+OuZqgW0GZ6O7LsfGAW+4P9N8ltFD+VKv4povwpSsKvKR1QIydcapvEKBMrFIkmXV66dBfcJffs4u3OxezOhF+/vgb8OY6CojYYXNypZLtiBeB6/E/XUr7RZ9XZICCrQ352kS6CooKaaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAJf5NQo; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAJf5NQo"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39675172593so5858445a91.2
        for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038007; x=1789642807; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=oAJf5NQo72cJLcP5Td4bhWsikaFGiEskYJDbePzh/sJ23gDHu8DrRRl3FsMg83ASe6
         x+BeHD/qoeUQRcHuO32F7ShYGfGqFgrtMRXKFllKH7qxti958bHLjtmXGmAOb3lyV7nN
         t/oY8qgJcOnL2ilzikWX3YJ3zyNo2raw6R/CnGomQwywtn4WLCCHgXucH+Wdd3o8TOpW
         RH/jzv5rPilkIQzFOZFPnuWp2dxBbHqFKAaGyAs3CxeKw1UZdQJ5yjKDSsqcx2+URTtp
         mZ/RIHcW4ifUbHPD8/KQa/zmz2ya/eIdY0ikcy6C0QUbtqHNUaERY/CqG1M0H7ynwSZR
         ByDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038007; x=1789642807;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=I+sBE1eiHzmLNmhZi8hzQj5mwaBSJH5Vl62+tjlqnOf/jDcRQ/pp1E8utj2uqCHtts
         tTtIQXZUkBJ1VmLPEaaP7pKJ1+gnIt2D99FpbXLEYR5bpikIR8iW3g04UpoIAutsIg61
         IzoJCdXkSyeuaWZ2QGjhkVeaKDhhyVwuXj7sl/+ySkVlqfhd0zSjN3KzQjkO7/viecn5
         UyYN3aZwVl8C1lqYr07A5+lQBpq7PItZIdU0HFVpiNMDjmw4SaXy4nZF0rYcgIFOpEI7
         0KNGbkAxpj9gv6jJGgpdUkAN4ZZKa7PgsT8iDV9cJ8J7pUFAMCmTJZUQ0Ua66F1z5nAD
         3CMw==
X-Forwarded-Encrypted: i=1; AKwUvByCgwhatYH/oVSiUKm/rSnbPgkwVo9AvbU0khHIaTG4wzHgtlzVkWKc9tdIWV/vImZSjbiVYeYoHFE=@lists.linux.dev
X-Gm-Message-State: AFuF++kldpIG3wQXHciLbeqJ8KrQ5vAlktNMAozSiIe/adLBPXaBBR3O
	IOyqs7lXuBHkcYgdcglFZZxatNCQZNjxq1DDLIjy1hOLvxq2wmKBavjU
X-Gm-Gg: AYBFou0lXZFbQMIUEYRwghnV7AIrfWwbcZ8GoCgqTJb8uGaCKUoeXoI9dEZh8n3C/NC
	EOqklyYv+1M2h7QlR6thbVg0WabEmAoO+7PauO5dIO3lbh3On92BDZbT1WKphj56hONLwW6SwAC
	mghYgM0kxi+hti0QdA25u039/X8sr0Wp+zmK8dOHNqjhRZ5I0LHhlqT7/6oc5gxVSUpezbFwcy5
	t/+MUgXs17+9MqbYuJ29T/J37gN7X9/tF8w6/ps/t6+gcn9zQdMatXcEkCYYUajYPg37uDoJ0Dj
	EoXGkCIaSUQgfo4ALzI3/aaGJGMxRljDM9YiTTGzP58BC0JzjRLi4koELMXmu88rpZ6dXhfUjGr
	FHrzTQeZ3kDFLcgEonFGIIIr2fwSQcAN1RuAfYLf0vLubEhvwwX4dj2/IcSGc2HTKRUX5E+VAgO
	No9osxYfTpPTTxtXFVYQ+DahYLfqLmINzQzOPtzAExh7/1w8JPT5Qe19HOfetSlJqpP7zWYrmo1
	9Qg/75YHIVMTdbU/zWHcIdPrObbccUvflQQ6CYecy7Vt1Ss3Gj2I5o=
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr58529054a91.21.1789038006053;
        Thu, 10 Sep 2026 04:00:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm46703778c88.13.2026.09.10.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:00:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:25:00 +0530
Message-ID: <bja51im3.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

Agreed with the reasoning. LGTM.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
