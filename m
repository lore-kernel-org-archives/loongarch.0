Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937888463
	for <loongarch@lists.linux.dev>; Wed, 14 Jun 2023 12:02:52 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.116])
	by gateway (Coremail) with SMTP id _____8BxZ+lrrIlkQh4FAA--.8929S3;
	Wed, 14 Jun 2023 20:02:51 +0800 (CST)
Received: from [10.20.42.116] (unknown [10.20.42.116])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Ax6ORqrIlk3pQaAA--.10230S3;
	Wed, 14 Jun 2023 20:02:50 +0800 (CST)
Subject: Re: [PATCH V1 0/4] irqchip/loongson: Fix some loongson irqchip
 drivers
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhuacai@loongson.cn>,
 WANG Xuerui <kernel@xen0n.name>, loongson-kernel@lists.loongnix.cn
Reply-To: loongson-kernel@lists.loongnix.cn
References: <20230614111426.5545-1-lvjianmin@loongson.cn>
Message-ID: <526be6a1-b965-a694-def9-c0a6c1693327@loongson.cn>
Date: Wed, 14 Jun 2023 20:02:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230614111426.5545-1-lvjianmin@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Ax6ORqrIlk3pQaAA--.10230S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr4xJr13Jry3Ar4kKFykJFc_yoW3Jwc_CF
	WI9rs7ur4Igr4xXay29ry0vFy3WFWjg3Wq9ryqq34rW39ag3Wayr4akwnxGa1xGF48GFn3
	ZrsYgryfA347CosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7
	McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jxSdgUUUUU=

Hi, all

So sorry for this wrong series which is old, please skip them.

Thanks.
Jianmin

On 2023/6/14 下午7:14, Jianmin Lv wrote:
> The patch series provide some fixes for loongson-liointc and loongson-pch-pic driver.
> 
> Jianmin Lv (2):
>    irqchip/loongson-pch-pic: Fix initialization of HT vector register
>    irqchip/loongson-liointc: Fix IRQ trigger polarity
> 
> Liu Peibao (1):
>    irqchip/loongson-pch-pic: Fix potential incorrect hwirq assignment
> 
> Yinbo Zhu (1):
>    irqchip/loongson-liointc: Add IRQCHIP_SKIP_SET_WAKE flag
> 
>   drivers/irqchip/irq-loongson-liointc.c |  9 +++++----
>   drivers/irqchip/irq-loongson-pch-pic.c | 10 ++++------
>   2 files changed, 9 insertions(+), 10 deletions(-)
> 

