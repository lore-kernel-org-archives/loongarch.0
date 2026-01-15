Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1332C331
	for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513693; cv=none; b=QhFBvcMLyrfzadWpf8AZeG9bZcEdU5f8tgAojmfMIcWakWr42wy/npp8vk98Hzylcm/oqzaGcjCQJRdenprbgFlx0b4QtPZznk0zjMvUkTT8Olch82f4KHo+9wz8HyrDPrQUIAvDsDyKT7sp+P36+C3JWNdGLo4ozpYBD+bCcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513693; c=relaxed/simple;
	bh=MU9UbiYSxwq7GU1nltEpbwVASUYpa31Sn9dlFINSwh0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hgR2D4kB4f5y3xRjSwSkFrRYmT+IygeFvsD7cuBjFbr+GsvDplmp1o/UZSW9vbZG8ksfxA1dO/bYa6qlI9INTTA74CHnmZPcBS8ge7XPC8VTwqSsUmpvyVBb8RfAZ3B34bu288PQTPIMfl6pvcl3PyNnvURcw6lcssogJoMPjb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XcRdZk5C; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XcRdZk5C"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5eea75115ceso1777089137.1
        for <loongarch@lists.linux.dev>; Thu, 15 Jan 2026 13:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768513690; x=1769118490; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=z1tpnpSOuS/Js87YOF2H5fRocDrhGRoFky0mpImVftk=;
        b=XcRdZk5CMES0T2VFpYYZU3SN39L7qpN94grf+5FsJwPcFiFGNdVpPfLASLgU35CWYh
         zUgr9YI2vOGyLApBKSvIPJtk5br0jK/rUgwXVe6D7/p7vRBU1wYrH2XOaSYS0+0qbwny
         yQoSfrxX+JOZU3xqmjWTnfPKtabHqCBw5Bfb7QRXALhdS4LAYkiOgQbYR9yOfHtkPgK4
         Q2uTQccbnQuDnQXcZcmZ46gQogz2QCQAoKiXvVRYFXMIIQ69Z2qFnjKkEbvLTaTBKNNC
         xs6q/8YAeCbTbWcIN1SDVmQ9Tm1S9m7e4Ui0FsUm12cEhtAv7klom4sw4bPBro4dlshh
         KVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513690; x=1769118490;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1tpnpSOuS/Js87YOF2H5fRocDrhGRoFky0mpImVftk=;
        b=aUrUaAzJjCmJTYqzM1RXn0eUaLT3Q6IFAF/A3Ls5XIRnmeWODF7Eph3IgAIs40IfVO
         TajWPVTZKLajcJF9ZRBsOp8Jlq6E9ojBy3EJm3K/AHRxKvnlnInryuHRfhlTXOy1kOPg
         zQTqZmkWNmwwSQF9yPcIm4+MbRzue8GgK/Yq2Un/G2y6BoAiYWD3slfjp/lRVUkENbg9
         b7ZOSjgWzKMxW7BslGdhKD7Cy7Ry1DbfUnu312h09TXpCWkakEytuPD1XZROCU+/7Eut
         58q8gO0WJlXGX6qjzYhE0WFuMndm3irW5HtD4UGXlB7++kLWxvgiIZGI0qEIFT8GKLnd
         K8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVNaFnQAHQ6gJC4y6WGKkNO2pGKHVCcUJpa6SKXQsmfzt2x0VI6UkWGdF1hSdbWlLG4TL+ecm/9hig=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzed3FuxiS/WqZd/JgbZfnhu93YCPB5RQocKAvgVh1ypgvjVGcb
	GfIESLP+KWMKa8P404UyWd3ov+VvqybKx4VDlbCgkN//FuQieRHRCZflPsZmW9eiTw7h5Yik0WV
	Kw64FlJeDlD+DoVWN9xncwgWwijCgolCfPCg3PSJT
X-Gm-Gg: AY/fxX7XpTQLadjrZKicVe5HzlGdsijX8ldBfzKHMQdCx12yD1BHBF9rVC5otXfLfoL
	o39zr+IQm7nBxiC+fHQSVnM246kmHj7o2yBIa5EeFuOnBIkx2wfVm7FyTwcLn0l8NqySNhu0A+z
	sTJJ+kAmK4T+WUytnYK2TLUe5ezxiTateL+cTRFIx5/KN40rY+tH7HodZHoUzf5ee7Fxbea8lVT
	wYhBn6NQ4IiSBoZsLH7TCrYD7mBj9L0KigqouZUrm8USALslfsn6LaIL4jILEbPw31GAVwDJlCv
	/1yM8qyTR89NdPNrIonOP1k9jd1vE+pQzWDa
X-Received: by 2002:a05:6102:f13:b0:5ec:3107:6b71 with SMTP id
 ada2fe7eead31-5f192508297mr1821684137.14.1768513689093; Thu, 15 Jan 2026
 13:48:09 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:48:08 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 13:48:08 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260114134510.1835-6-kalyazin@amazon.com>
References: <20260114134510.1835-1-kalyazin@amazon.com> <20260114134510.1835-6-kalyazin@amazon.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 13:48:08 -0800
X-Gm-Features: AZwV_QhGkMBioMKFssSOB50hq7Zm3qSZq1aP9Of9c8wem-vUHGjRo2vWaCWRwKU
Message-ID: <CAEvNRgEhcTE70RLiQo2C_XUdF31qSkQ6yHwpUiXPWb6+6mmA0A@mail.gmail.com>
Subject: Re: [PATCH v9 05/13] KVM: x86: define kvm_arch_gmem_supports_no_direct_map()
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, 
	"will@kernel.org" <will@kernel.org>, "seanjc@google.com" <seanjc@google.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, 
	"Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, 
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, 
	"sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, 
	"jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, 
	"shuah@kernel.org" <shuah@kernel.org>, "riel@surriel.com" <riel@surriel.com>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, 
	"yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, 
	"coxu@redhat.com" <coxu@redhat.com>, "kevin.brodsky@arm.com" <kevin.brodsky@arm.com>, 
	"maobibo@loongson.cn" <maobibo@loongson.cn>, "prsampat@amd.com" <prsampat@amd.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, 
	"jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, 
	"alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, 
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, 
	"dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, 
	"hca@linux.ibm.com" <hca@linux.ibm.com>, 
	"Jonathan.Cameron@huawei.com" <Jonathan.Cameron@huawei.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"pjw@kernel.org" <pjw@kernel.org>, 
	"shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, 
	"thuth@redhat.com" <thuth@redhat.com>, "wyihan@google.com" <wyihan@google.com>, 
	"yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
	"vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, 
	"aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, 
	"Thomson, Jack" <jackabt@amazon.co.uk>, "Itazuri, Takahiro" <itazur@amazon.co.uk>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Cali, Marco" <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"

"Kalyazin, Nikita" <kalyazin@amazon.co.uk> writes:

> From: Patrick Roy <patrick.roy@linux.dev>
>
> x86 supports GUEST_MEMFD_FLAG_NO_DIRECT_MAP whenever direct map
> modifications are possible (which is always the case).
>
> Signed-off-by: Patrick Roy <patrick.roy@linux.dev>
> Signed-off-by: Nikita Kalyazin <kalyazin@amazon.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index 5a3bfa293e8b..68bd29a52f24 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -28,6 +28,7 @@
>  #include <linux/sched/vhost_task.h>
>  #include <linux/call_once.h>
>  #include <linux/atomic.h>
> +#include <linux/set_memory.h>
>
>  #include <asm/apic.h>
>  #include <asm/pvclock-abi.h>
> @@ -2481,4 +2482,12 @@ static inline bool kvm_arch_has_irq_bypass(void)
>  	return enable_device_posted_irqs;
>  }
>
> +#ifdef CONFIG_KVM_GUEST_MEMFD
> +static inline bool kvm_arch_gmem_supports_no_direct_map(void)
> +{
> +	return can_set_direct_map();
> +}
> +#define kvm_arch_gmem_supports_no_direct_map kvm_arch_gmem_supports_no_direct_map
> +#endif /* CONFIG_KVM_GUEST_MEMFD */
> +
>  #endif /* _ASM_X86_KVM_HOST_H */
> --
> 2.50.1

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
