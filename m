Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF2C2045AD
	for <loongarch@lists.linux.dev>; Thu, 11 Jun 2026 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781141469; cv=none; b=qsxtTeB3cjSl7j8uS2qsnY4BUDsy2J2z3PbdicMrK04VhhcHNG+J83eMEpvJ7Q39MiZP0XlkXrg4k8HZ6kDiVyT6i9D/klBPxg/Td0iKbYOsrbmVSKMwuU/5F4IxNqL4RVrVQ5j31vSOtMUOqusnsLziV+oII1zSqD203A1ekm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781141469; c=relaxed/simple;
	bh=IQSVmJWAh9rSyjJ/S7l6egCVlHMBKoRs1p3/gSZx/Wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ba3fY8rJ+o6QHkiI67rP36AFwtclyvSydTi9NWuOaoYP3eOONWX/cNGBZQfhJzzXe2czynMtteL0Kemx4BQqOJqjdPlZM7glQXslkYuoAZZA5B0wJUXsPrgJ3lXtqP/wuNOl+a10KuErIQWZVJmJl+gg0sJOkVZ3/7SySlqVCgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=3gZH/hNn; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="3gZH/hNn"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=RBlgvudl+cGjprXWFObeeRS2MUnS8N5YzsCKOc0pnqk=;
	b=3gZH/hNn+g7QWrpLfYH3VIVhOi+KC+luwjGIe9WtEed6xfgF9PTswIocwyjpaWEgUrlrl483x
	xRsRvhaB6WhwMvFr8+me5PjwErrqXqd54SKqfYa3Ow2i+D3OOZmZcCexoeWlyy5YNsYoV0Xjm9e
	xyc3UBr9eQflKVxitdNqgYY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4gbPys18dZzcb1Y;
	Thu, 11 Jun 2026 09:22:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 4E7252025F;
	Thu, 11 Jun 2026 09:30:58 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 11 Jun 2026 09:30:55 +0800
Message-ID: <37f31716-095b-477c-9b0b-946a15275c2e@huawei.com>
Date: Thu, 11 Jun 2026 09:30:54 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/10] arm64/riscv: Add support for crashkernel CMA
 reservation
To: Andrew Morton <akpm@linux-foundation.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>, <bhe@redhat.com>,
	<rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<ruirui.yang@linux.dev>, <rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <kuba@kernel.org>,
	<lirongqing@baidu.com>, <ebiggers@kernel.org>, <paulmck@kernel.org>,
	<leitao@debian.org>, <coxu@redhat.com>, <Liam.Howlett@oracle.com>,
	<ryan.roberts@arm.com>, <osandov@fb.com>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <sourabhjain@linux.ibm.com>,
	<ritesh.list@gmail.com>, <adityag@linux.ibm.com>, <liaoyuanhong@vivo.com>,
	<seanjc@google.com>, <fuqiang.wang@easystack.cn>, <ardb@kernel.org>,
	<chenjiahao16@huawei.com>, <guoren@kernel.org>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260608073459.3119290-1-ruanjinjie@huawei.com>
 <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260608091000.d88d7f5cc1bc4fa17f5774fe@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 6/9/2026 12:10 AM, Andrew Morton wrote:
> On Mon, 8 Jun 2026 15:34:49 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
>> and crashk_cma memory are almost identical across different architectures,
>> This patch set handle them in crash core in a general way, which eliminate
>> a lot of duplication code.
>>
>> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> fyi, AI review might have found a bunch of issues in arch-specific
> code, all of them pre-existing.

Hi, Andrew，

As Mike conveyed, Baoquan proposed splitting out the unrelated bug fixes
into a separate patch set, in order to keep v16 from growing excessively.

Link: https://lore.kernel.org/all/ah2Lx7KHI60tzd0v@MiWiFi-R3L-srv/

Best Regards,
Jinjie

> 
> 	https://sashiko.dev/#/patchset/20260608073459.3119290-1-ruanjinjie@huawei.com
> 

