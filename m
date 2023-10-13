Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7068B125A0
	for <loongarch@lists.linux.dev>; Fri, 13 Oct 2023 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8BxIvAMJillYbIxAA--.29475S3;
	Fri, 13 Oct 2023 19:12:12 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxjd4KJilleMkiAA--.9894S3;
	Fri, 13 Oct 2023 19:12:12 +0800 (CST)
Message-ID: <9c2ec240-bca0-4f99-96db-a5156bbd82e5@loongson.cn>
Date: Fri, 13 Oct 2023 19:12:09 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] loongarch/mm: disable WUC for pgprot_writecombine as
 same as ioremap_wc
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>,
 Icenowy Zheng <uwu@icenowy.me>, Huacai Chen <chenhuacai@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Weihao Li <liweihao@loongson.cn>, "Mike Rapoport (IBM)" <rppt@kernel.org>,
 Jun Yi <yijun@loongson.cn>, Baoquan He <bhe@redhat.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Hongchen Zhang <zhanghongchen@loongson.cn>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Zhen Lei <thunder.leizhen@huawei.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Thomas Gleixner <tglx@linutronix.de>,
 Zhihong Dong <donmor3000@hotmail.com>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20231009042841.635366-1-uwu@icenowy.me>
 <4f1af31b-15be-cb47-6b34-45de1b5696be@loongson.cn>
 <42b0e6f6-c2b5-49c6-b1f2-0200bef913da@xen0n.name>
 <3641d3fe-c2e7-868f-ab0d-3951c9a78b6d@loongson.cn>
 <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <8373ccfd93b0402caf9f5c06a2d9b93b3c0d0b49.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cxjd4KJilleMkiAA--.9894S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoWruw1fWr4xXFy8GFy8uFy5WrX_yoWfGrX_uF
	yDWwsrGwn5WF1DJwnYkr4IqrWagrn2vry8Ca9rJF13J343X3yxKF4kGr95Zw18JF4rGr1U
	Gr93Aa9av3sI9osvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4SoGDUUUU

Hi,


On 2023/10/10 20:26, Xi Ruoyao wrote:
>> For DMA non-coherent buffers, we should try to implement arch-specific dma_map_ops,
>> invalidate the CPU cache and flush the CPU write buffer before the device do DMA. Instead
>> of pretend to be DMA coherent for all buffers, a kernel cmdline is not a system level
>> solution for all of GPU drivers and OS release.
> IIUC this is a hardware bug of 7A1000 and 7A2000, so the proper location
> of the workaround is in the bridge chip driver.  Or am I
> misunderstanding something?


The ls2k1000 and ls2k2000 SoC (which don't use with 7A1000 and 7A2000) are also suffer form this
problem. If this is a hardware bug of 7A1000 and 7A2000, why forbidden WC mapping of pages in
system RAM?

The problem of this patch and the <16c52e503043> commit is that it forbidden all WC mappings by
default. Even pages in system RAM.

