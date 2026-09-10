Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB1472535
	for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039689; cv=none; b=PtNg6YboqANdXcuIIGk9JPB3HVl0zPaBy72uhUmrsaZpb5vNQxDwZoqWWtOwn/eUaSWjRZrHbN046Inyt99Qoi2ttHYsOHaO2a7p8+BFQpLn0F4EMAkNoFpp9TBY7nG7zIUa/+BHe1gxrjx6K8Ssr8l6fUlRR/VKBVX6Zr1hS2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039689; c=relaxed/simple;
	bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=hueGXPlR/2VvtSXSByCW+wr5Q/NMxVU+WFvLf00VDb46W47rUFhXIeJY3Jxc3PgVRAdEKwg4YmYMMeI4CCGg9SSRpYPSdx5amyWwiBkMhY/11TvohxI9ps/sjEkqvM6FUkXIIY8H+f34Rhh3GdHzyjHEq5ZvNa5v2JnB0kuQamg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3fx208q; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3fx208q"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f4f53975e6so6752977a34.3
        for <loongarch@lists.linux.dev>; Thu, 10 Sep 2026 04:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039687; x=1789644487; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=g3fx208qu0u1kyqQsSIXq7ASD4vHT7Z3WvZVACvloM7AggOw3mvxdHsONGEeypjUBQ
         PO9KqX82F3svqqc3Qa+1xLASx2n9kRa3WZfXp1c+H7Og6nqKLKW8lwrVLF0Hc6p9rWXy
         mjGJF9Qe9S6sn3WQirmfTYkU8TjoTU2gfAn481+5vWlH8TX+bGsbKirc9YpuunNqJOIq
         eY+Z8nTxf+h2Knk+zw4+t1js/NKjPDF3ekDmTc56BS0z0Oqwn4AibabeQ6BKtoD6ym3L
         CdrkMYEpC1Dsore808WvqIdEm2rN13Ky3C+DKKa8grMyYIq953mTf0sRw5B1sxXbxmIm
         s2xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039687; x=1789644487;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=ijPCLKa+U3YUqCToaxcpeTIOFn0hnu1ysE52dOe7glseOTozKj5Bb1Os1+v91ygmKG
         zOLLiKad+WZcnkuFeUuR9oObnTIW7PS+9lF0s+FCblNTSwZzppzc+YxqifanlYaEI0jl
         5zgcOM4PbGvlJn8PVGrxGecasfLnE6mE413GWk7RHN/NgzzNHivDpPRw1+0MTFY+ryw6
         m8bVbuFdLpcPkqDryVJxAa3ip02HPzfWwQS0ikmG1z5dNVvZcKhLaNB5OZKx2WSZ9SCu
         o/yzTsX1fyTEFrOpmAUBVSWgRYe+pQgvrg6DM197SW7iiZ8ZGbS6qeTlaJSs3xo1wM9S
         UPXQ==
X-Forwarded-Encrypted: i=1; AKwUvBymF1hnavrX9n+sWwQRZQyrc0sYZif38gHDtqIba2NfOCSiVPjCF2vGWD5xTgobnwQ940DI7oWU+Og=@lists.linux.dev
X-Gm-Message-State: AFuF++k7ZjYH9YSx9D+tv7/GqwKtcrXiQP/LJyMbGYTtSl2Wj4jONwOp
	I7FBnyUqeeuFUBopcBbHnRxB/nVts61wmTBN9e1sxqEqs2fOYQMr3oUqK8T00g==
X-Gm-Gg: AYBFou2VejCZKFcaqqmd6IF1pZYt6fQ9bo0TW8jNuEQDIw4DHGCaEb0WeUYuusxEMhj
	pA5RWSUIF5lD8Y51NkHGlw1uRndxzzGDi1v/HLm1TLOAJyDWs8O6Yd0jXKX7f0LZrm7xwf3s6EU
	QyShq7FOZL08BM4QBI3EcvXJKpLEraaA3rbK5YSoWw4RpzIwjw9+MMYxpoGAovBBhRIA9ThVjDG
	+LrixTm1UMRQ+Ckm4x/goy1w+xU8y9JM/XPUn3h4FPIJrtW/AmZCUAzcBh+VS0vtt2/R7GZQf+3
	5viozn14jNaJ7If4RnvtvifdQo2hJd7RFoDvfOdawhjTMby1I5n727CeKEaSIc0p6Gcn9tPNjpC
	LNpo623Hra1Yo+pb2MYU8MloKhXwB6en+BME3G7knNvaBaBMrgtCzYzGPbnaWJ0SABVzNVuUaHL
	uC+is7dQRXqusqeZOiJAva/owrLt+1z+k8+dgdT1D62ZAGMolK8Jxr9hMDoLIqL8iv5q+RTFcgf
	xZyY9FQ/9puZ+kQWEmXyoaT/fBP7Z0eAwrcMQhza2OAhiEY5YfKMyyIiX8of9AoCQ==
X-Received: by 2002:a05:6808:f09:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4b95db6da80mr27637088b6e.0.1789039686755;
        Thu, 10 Sep 2026 04:28:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm49398440c88.8.2026.09.10.04.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:28:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
In-Reply-To: <20260902164123.2546762-19-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:57:29 +0530
Message-ID: <4ifx1h3y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-19-seanjc@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

Sean Christopherson <seanjc@google.com> writes:

> Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
> input is guaranteed to fail the test, and with the standard error message
> format.
>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
