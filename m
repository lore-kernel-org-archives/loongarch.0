Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697369;
	b=VvF6Zz75qSDV2lgiPD/S97x5Z5Zc9m8VU1I0jkrZvFWXTCrRmObnUk+8UTrOnm/lPm7g
	 Jf+kT85EVpPCtw48RYU7PaXqIeDia4Wnx1iPVgMfthPUwCw9k6OUaKsyRI87ZJeQ/h5hd
	 gFLZ1njlwVQbNKo6CJHgx4Hr6WGFd0wxNE36pgknbmhivuKgFZovzHBAGLW1Twh5OugpJ
	 iHOG347IVgD7Z121m44iA2G6ng6dAYNyuiMqYFAJ51EdwZReQbOFxkXuxqhFfRp1DzILE
	 T21sMJm4W2oYhDPPhbvV8GP2uTXJiwoGWBCJ+tdqjFQuyiaA1YVi+7GnZaf0adyqFfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697369;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=48sfBtezaLrmsDLxpZBqDtVgmBMh4esLZj8eSRsa2cM=;
	b=eQVE/G/zCwXtb3rhAHdrTQC954vwDzcwTZjUYMkg4RvE27VgoqnUR7J25S2LA/WggZR6
	 gLacMruk52MEi+Y2Xv9ZkQE/j1SXIftf60ysb+UCTfFaZC6AdatxP9rbEsTfDEzKWF7p2
	 m5tVJhdReY+KIlYKNsYJI+Z0qIWit+TNDVNrQGxQ8IYK4uz6vuzRBA42akfX6DE+DkSvr
	 LywbPdaKyeFpH2w0XCvduGCQGZerBbBeAzQDt7p7njpmhgA1oBWw5SfNVtaznG1MbgN/9
	 t+OJLYYDRltmFeG49gkyhglcdJo0UJeGr1Pa4ysN0lzMheF+tnStq0BYq7YY2nj6XQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b="MQ7/wjZC";
	arc=none smtp.remote-ip=113.46.200.216
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20DE606A32F
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 09:16:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F20DE606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=MQ7/wjZC
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=48sfBtezaLrmsDLxpZBqDtVgmBMh4esLZj8eSRsa2cM=;
	b=MQ7/wjZCJByib4DUAG1rr8PWbq4ZKNqzIaaZ0Biehny2BBZjAjV3wKEwUZvkviWzcCEbf0g+v
	XU2u1c0FR7BeFFcd2sKiP2M9NRejpiGNFnV1aQNjASXnIdM5gSq78pUOH9pz1/Cnp1FM1nmDrIn
	G/mzrhIC2kG1FA5PLDo4uzc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jJjbc4bwXz1T4JR;
	Tue,  3 Nov 2026 17:15:40 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D79EB40538;
	Tue,  3 Nov 2026 17:15:58 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 17:15:57 +0800
Message-ID: <f3f239df-6d94-46b2-aa0d-e890a509cda1@huawei.com>
Date: Tue, 3 Nov 2026 17:15:56 +0800
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/15] arm64: kexec_file: Fix CMA page leaks in segment
 placement retry loops
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <thuth@redhat.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <robh@kernel.org>, <sourabhjain@linux.ibm.com>,
	<kees@kernel.org>, <coiby.xu@gmail.com>, <Yeking@Red54.com>,
	<tangyouling@kylinos.cn>, <maqianga@uniontech.com>,
	<zhangtianyang@loongson.cn>, <guodongtai@kylinos.cn>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <hui.wang@canonical.com>, <sohammetha01@gmail.com>,
	<guoren@kernel.org>, <gaohan@iscas.ac.cn>, <kai.huang@intel.com>,
	<kas@kernel.org>, <vishal.l.verma@intel.com>, <piliu@redhat.com>,
	<jbouron@amazon.com>, <mclapinski@google.com>, <me@linux.beauty>,
	<graf@amazon.com>, <bgwin@google.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
 <20261026075201.699550-4-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261026075201.699550-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Will fix sashiko review issue in v8.

在 2026/10/26 15:51, Jinjie Ruan 写道:
> The retry loop drops nr_segments, leaking the CMA pages of the failed
> segments.  Release them first, and disable CMA for the retry: it
> ignores buf_min and would hand out the same region forever.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Breno Leitao <leitao@debian.org>
> Cc: Pratyush Yadav <pratyush@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: stable@vger.kernel.org
> Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/kexec_image.c        | 8 ++++++++
>  arch/arm64/kernel/machine_kexec_file.c | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
> index 74d24c8aa2fa..6ed1991e3142 100644
> --- a/arch/arm64/kernel/kexec_image.c
> +++ b/arch/arm64/kernel/kexec_image.c
> @@ -111,6 +111,14 @@ static void *image_load(struct kimage *image,
>  		 * We couldn't find space for the other segments; erase the
>  		 * kernel segment and try the next available hole.
>  		 */
> +		/*
> +		 * kexec_alloc_contig() ignores buf_min, so disable CMA to
> +		 * let the retry make progress.
> +		 */
> +		if (image->segment_cma[kernel_segment_number])
> +			image->no_cma = true;
> +
> +		kexec_free_segment_cma(image, kernel_segment_number);
>  		image->nr_segments -= 1;
>  		kbuf.buf_min = kernel_segment->mem + kernel_segment->memsz;
>  		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index 854d872dfd0f..e48f29167b38 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -179,7 +179,10 @@ int load_other_segments(struct kimage *image,
>  	return 0;
>  
>  out_err:
> -	image->nr_segments = orig_segments;
> +	while (image->nr_segments > orig_segments) {
> +		kexec_free_segment_cma(image, image->nr_segments - 1);
> +		image->nr_segments--;
> +	}
>  	kvfree(dtb);
>  	return ret;
>  }

-- 
Best regards,
Jinjie

