Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D68173
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 02:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774232164; cv=none; b=kfRSLGPRUMscNobLXbtRK/HVh4bcvqrWD9xwlzK+rqsHvqs+bI/DaGoS0Oqpc3IwKwyzH5znoOVW/Jx/UdZ/Q0EXVb5rn+OUPO+X3vhPqVin1OSONeiRoCXzICTXaQ2U/UsBqVtF48Aq0FvXK0J/G8m6U8qlxqPIca4OF1A2JDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774232164; c=relaxed/simple;
	bh=dLsxiTvkE+45rzRih3tI3ukrt39c9C/5wfid5B+NO0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=plODP+3clYpx7yPdB0lecpYpUVIHoiM5GNOP+X7HiLdJZOQvIOyavJeGcSbKFRgTVsWReVgx7UlhBOHfL8o4JsM/strze1PsYawHDTDHKemCAMAW4XlEXww5qWRAJZa5pOgu/rxAsWU/LO13ihBbUTD7rYWsK0ZJGfJ4Lk5eEMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=y3Xbkkm3; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=y3Xbkkm3; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="y3Xbkkm3";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="y3Xbkkm3"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=R5jIawgYWsUZf+zva/5Ugy+eZOQoWT60xSBcueOhzu4=;
	b=y3Xbkkm33OuzIVeOTkvy3KpKEPcdf2aDbqAe3Lg6LRtI41eVGLOzLzEHaXMCw85OESY1/4bI2
	bPphRkVD2M+iRz/lb01qPoNmCTKGtBzHctxQ/gkE4GpAhkYl12sCafXE+ut9iIm15PjCGESUiss
	J6rjzuriAJCkMeqt9jfnwnw=
Received: from canpmsgout09.his.huawei.com (unknown [172.19.92.135])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4ffGx42FFzz1BJsW
	for <loongarch@lists.linux.dev>; Mon, 23 Mar 2026 10:15:52 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=R5jIawgYWsUZf+zva/5Ugy+eZOQoWT60xSBcueOhzu4=;
	b=y3Xbkkm33OuzIVeOTkvy3KpKEPcdf2aDbqAe3Lg6LRtI41eVGLOzLzEHaXMCw85OESY1/4bI2
	bPphRkVD2M+iRz/lb01qPoNmCTKGtBzHctxQ/gkE4GpAhkYl12sCafXE+ut9iIm15PjCGESUiss
	J6rjzuriAJCkMeqt9jfnwnw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4ffGnw4XfYz1cytY;
	Mon, 23 Mar 2026 10:09:40 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F0BC0402AB;
	Mon, 23 Mar 2026 10:15:43 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 23 Mar 2026 10:15:39 +0800
Message-ID: <e666d76c-cd76-306e-a6c2-232c6815271b@huawei.com>
Date: Mon, 23 Mar 2026 10:15:38 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8 0/5] arm64/riscv: Add support for crashkernel CMA
 reservation
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<pmladek@suse.com>, <dapeng1.mi@linux.intel.com>, <kees@kernel.org>,
	<paulmck@kernel.org>, <lirongqing@baidu.com>, <fvdl@google.com>,
	<rppt@kernel.org>, <ardb@kernel.org>, <leitao@debian.org>,
	<sourabhjain@linux.ibm.com>, <jbohac@suse.cz>, <cfsworks@gmail.com>,
	<osandov@fb.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <coxu@redhat.com>, <liaoyuanhong@vivo.com>,
	<fuqiang.wang@easystack.cn>, <brgerst@gmail.com>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
 <ce99a024-f910-cd83-c60a-28e60db318d3@huawei.com>
 <20260322185853.e8e43c346ed98a0ef0544948@linux-foundation.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260322185853.e8e43c346ed98a0ef0544948@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/3/23 9:58, Andrew Morton wrote:
> On Mon, 23 Mar 2026 09:44:21 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> If there are no other review comments, I'd like to ask if this is ready
>> to be merged.
> 
> This patchset predates the introduction of the Sashiko AI review, and
> that thing is proving very good at finding issues.

That would be good to use this tool to find the low-level issues.

> 
> So can you please update the changelog footers for thus-far-received
> acks/reviews and then resend?

Sure.

> 
> Thanks.
> 
> 
> 
