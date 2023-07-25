Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C83C7C
	for <loongarch@lists.linux.dev>; Tue, 25 Jul 2023 00:36:23 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8BxnusGGb9kZXsJAA--.21403S3;
	Tue, 25 Jul 2023 08:36:22 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_c4GGb9k_fE5AA--.25539S3;
	Tue, 25 Jul 2023 08:36:22 +0800 (CST)
Message-ID: <8d22477f-d7e4-b151-f72b-cea3f1ef3ef3@loongson.cn>
Date: Tue, 25 Jul 2023 08:36:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] LoongArch: mm: Code cleanup with populate pte
Content-Language: en-US
From: bibo mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 WANG Xuerui <kernel@xen0n.name>
References: <20230712031622.1888321-1-maobibo@loongson.cn>
In-Reply-To: <20230712031622.1888321-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx_c4GGb9k_fE5AA--.25539S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZFWDGrW5Kw1rXF1kKF18CrX_yoWxKFg_XF
	yftasYkr4xXayUKFWvgF4rJryUCF4kAF1ktFyDJFW7JasrJr17Jr4UAan8Zas0vFW7trs8
	Aw45ArnYywnrKosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j2MKZUUUUU=

slightly ping.

在 2023/7/12 11:16, Bibo Mao 写道:
> There are some confusion between pdg and p4d when populate pte for
> kernel address space. This patch modifies this issue and adds unified
> function for pcpu and fixmap populate pte.
> 
> Bibo Mao (3):
>   mm/percpu: Remove some local variables in pcpu_populate_pte
>   LoongArch: Code cleanup in function pcpu_populate_pte
>   LoongArch: mm: Add unified function populate_kernel_pte
> 
>  arch/loongarch/include/asm/pgalloc.h |  1 +
>  arch/loongarch/kernel/numa.c         | 35 ++-----------------
>  arch/loongarch/mm/init.c             | 52 ++++++++++++++++------------
>  mm/percpu.c                          | 24 +++++--------
>  4 files changed, 42 insertions(+), 70 deletions(-)
> 

