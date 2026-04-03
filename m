Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE997259CB2
	for <loongarch@lists.linux.dev>; Fri,  3 Apr 2026 09:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775207715; cv=none; b=MAzPbXtiLgasQwoELdTVnal8Eal7JlOQId1LTAG1Q98rWluHeBHf8QfjkNWlTcBAZ+Qq7yx+b/yebuiZbfxHxispelbV7yxwPkRI4YNBPGAzWqsf18tjInn8ezMbZfETLgsbbv5PP64pGLqMpFH2Iw4SB2YAOxoI73NqEir6lkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775207715; c=relaxed/simple;
	bh=Qh3ffqlIFxz7tQq3QhuKOsjMiTfg6RnjpCUIwVk5E7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jVluotGwXmIsYSk/PFF9qCh1fDe1QEEjffQ2t/aAP8jlLBAQTzn1/xTVy1//bdDGmi3Ex/mTKNDw1mYCHridqiv4Xybp/7EQolz0+eRjC7D6nkbN/0TX4mfyZyCoTDejlOf4R66yowyZPUjLwhJ7sx1fh/FE2OjFjp8ItIDgM6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Ng5I2f7+; arc=none smtp.client-ip=113.46.200.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Ng5I2f7+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1u/gaQ+oVmmKaoGhJfA0lv+PgPfetH5Z+BotMjq1x2M=;
	b=Ng5I2f7+M26BlWo+f15W4F3KICwNL5iu3h39vY8J/Yh43OjddzRD1MsWnEf25APCV36pJ7jaV
	E+dS9RuezRSZ5OUSyATrJYym/oMSq0Q/fgtStWYYumuP16zq8mKRFCRw0duIgZtaeNEb1yxvcFU
	83ODrCmyuPyUV05deMYPVP0=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fnCZW0jdKz1prlD;
	Fri,  3 Apr 2026 17:08:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id E56E540571;
	Fri,  3 Apr 2026 17:15:04 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 3 Apr 2026 17:15:01 +0800
Message-ID: <c5ee66fe-ecc4-2eb4-4b58-44f7d292d221@huawei.com>
Date: Fri, 3 Apr 2026 17:14:58 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v12 00/15] arm64/riscv: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<robh@kernel.org>, <saravanak@kernel.org>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <rppt@kernel.org>,
	<leitao@debian.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<guoren@kernel.org>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<takahiro.akashi@linaro.org>, <james.morse@arm.com>, <lizhengyu3@huawei.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
References: <20260402072701.628293-1-ruanjinjie@huawei.com>
 <20260402113137.GAac5Tmc5b7SL98KdY@fat_crate.local>
 <c6eb858c-5275-6fdc-b6e9-bd6d4b169e05@huawei.com>
 <20260402133644.GBac5w7OYl9MwvVxY_@fat_crate.local>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260402133644.GBac5w7OYl9MwvVxY_@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/4/2 21:36, Borislav Petkov wrote:
> On Thu, Apr 02, 2026 at 07:47:53PM +0800, Jinjie Ruan wrote:
>> Thank you for the reminder and for your patience. I apologize for the
>> frequent updates; I am becoming more familiar with the community's
>> workflow.
> 
> Yap, and you can use that time while waiting to learn about it:

Thanks for the pointer! I'm using the wait time to dive into the process
docs. Definitely a lot to learn about the workflow, but I'm getting there.

> 
> Documentation/process/
> 
