Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0457919DF62
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 04:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774324990; cv=none; b=tJTgQrkgtNIBD11gHcv96RlJaseD51b0a/XB91uzv5NSMgITTkgvJj+AtyDD6UYAVA5Ti3q5yNp1OccN/4EcrgwCL3gL2aA42gnoj1vqp3qQ9FH31mDCK1CN1deT/ewI75xBH7bl7/W5ecBLqmSrn5Mm48CZ4vsiU1SMJuKRIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774324990; c=relaxed/simple;
	bh=Yd1UzP5UWrtkJjTCh10X281adPzuWFxkeN3qZhLHyAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MtksnD+KaC0F6/IFMUm0E272tn3DMN8P2g/oQuZe88BgiwRkRrp8iQ9BJ0GvuS5js10PsgVoK4DIBb+CWhrR2m4hurWhkM/MA4GcldjCz1/ms2dx3RBn5+tZPBY2hdrA3WMLatW4BzvwjWQL/hbXrgmpNsfreDdE6piTzUl8MyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=ZdiH1pgl; arc=none smtp.client-ip=113.46.200.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="ZdiH1pgl"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=bDy1WqzyWZ4QXi9V76+nhfaX5tyIvisESl1ex2cgViU=;
	b=ZdiH1pglApVl4a6IeiYB/RNIPfMQalqh1J1N6H54h+m4wVAkBIL12akP2v0PgO4JxJv57h8AL
	Sz/Bww8R1NtzLrMTjBlHDOVrLDCImsP+6ecp+QIQd2fWrygKLGWJO1InyvsolTRvUDIfiWTeLx6
	ALNTxdX6ngOuZZaJRk7Pqc4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4ffx7B5xTXzRhRB;
	Tue, 24 Mar 2026 11:56:54 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A0A44404AD;
	Tue, 24 Mar 2026 12:02:59 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Mar 2026 12:02:57 +0800
Message-ID: <4cfde40c-673a-12b0-dfc5-703d582d6ea9@huawei.com>
Date: Tue, 24 Mar 2026 12:02:51 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA
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
	<peterz@infradead.org>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <safinaskar@gmail.com>, <rppt@kernel.org>,
	<ardb@kernel.org>, <leitao@debian.org>, <jbohac@suse.cz>,
	<cfsworks@gmail.com>, <osandov@fb.com>, <tangyouling@kylinos.cn>,
	<sourabhjain@linux.ibm.com>, <ritesh.list@gmail.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<kevin.brodsky@arm.com>, <samuel.holland@sifive.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
 <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260323095548.fa4e13d6e8ae5005ae585e13@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)



On 2026/3/24 0:55, Andrew Morton wrote:
> On Mon, 23 Mar 2026 15:27:40 +0800 Jinjie Ruan <ruanjinjie@huawei.com> wrote:
> 
>> The crash memory allocation, and the exclude of crashk_res, crashk_low_res
>> and crashk_cma memory are almost identical across different architectures,
>> This patch set handle them in crash core in a general way, which eliminate
>> a lot of duplication code.
>>
>> And add support for crashkernel CMA reservation for arm64 and riscv.
> 
> Thanks.  AI review has completed and it asks questions:
> 	https://sashiko.dev/#/patchset/20260323072745.2481719-1-ruanjinjie@huawei.com

I believe it identified 4 valid issues:

- The already discovered crashk_low_res not excluded bug in the existing
RISC-V code.

- An existing memory leak issue in the existing PowerPC code.

- The ordering issue of adding CMA ranges to "linux,usable-memory-range".

- An existing concurrency issue. A Concurrent memory hotplug may occur
between reading memblock and attempting to fill cmem during kexec_load()
for almost all existing architectures，I'm not sure if this is a
practical issue in reality..

 Race Condition Scenario

  Timeline:
  ---------------------------------------------------------------------
  T1: kexec_load() syscall starts
  T2: kexec_trylock() acquires kexec_lock
  T3: crash_prepare_headers() is called
  T4: arch_get_system_nr_ranges() queries memblock → finds 100 memory ranges
  T5: cmem = alloc_cmem(100) allocates buffer for 100 ranges
  T6: [RACE WINDOW] Another process triggers memory hotplug
  T7: add_memory() → lock_device_hotplug() → memblock_add_node()
  T8: New memory region added to memblock
  T9: arch_crash_populate_cmem() iterates: now finds 102 ranges
  T10: cmem->ranges[100] → OUT OF BOUNDS WRITE!
  T11: cmem->ranges[101] → OUT OF BOUNDS WRITE!
  T12: Kernel crash or memory corruption

  Why This Happens

  1. Different locks used:
    - kexec_load() uses kexec_trylock (atomic_t)
    - Memory hotplug uses device_hotplug_lock (mutex)
  2. No synchronization between these two operations
  3. Time-of-check to time-of-use (TOCTOU) issue:
    - Step T4-T5: We query the number of ranges and allocate buffer
    - Step T6-T9: Memory hotplug adds new ranges between query and
population



Any comments or suggestions on the following approach?


int crash_prepare_headers(...)
  {
      unsigned int max_nr_ranges;
      struct crash_mem *cmem;
      int ret;

      lock_device_hotplug();

      max_nr_ranges = arch_get_system_nr_ranges();
      // ...
      ret = arch_crash_populate_cmem(cmem);
      // ...

      unlock_device_hotplug();
      return ret;
  }


> 
