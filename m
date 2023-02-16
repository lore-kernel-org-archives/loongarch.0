Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1AB20FB
	for <loongarch@lists.linux.dev>; Thu, 16 Feb 2023 08:03:15 +0000 (UTC)
Received: from loongson.cn (unknown [192.168.200.1])
	by gateway (Coremail) with SMTP id _____8CxSNlB4+1jBT8BAA--.2884S3;
	Thu, 16 Feb 2023 16:03:13 +0800 (CST)
Received: from [0.0.0.0] (unknown [192.168.200.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxc+U+4+1j_Gk0AA--.63148S3;
	Thu, 16 Feb 2023 16:03:11 +0800 (CST)
Subject: Re: [PATCH v4 2/5] LoongArch: Use la.pcrel instead of la.abs for
 exception handlers
To: Xi Ruoyao <xry111@xry111.site>, Jinyang He <hejinyang@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>
References: <1676018856-26520-1-git-send-email-tangyouling@loongson.cn>
 <1676018856-26520-3-git-send-email-tangyouling@loongson.cn>
 <CAAhV-H4Bs5n_ek3mq6zwxAgVw0nvER1XUA+WUA8M12eKcYVPDQ@mail.gmail.com>
 <05ef2d91-ab87-b8d9-85fa-6a90a92f8f39@loongson.cn>
 <848e2985-9ba3-c14d-23ac-a7f1c218215f@loongson.cn>
 <5adf0fc4-b75c-f7f2-311c-0f5d8f14311b@loongson.cn>
 <48c4b1f81c21950e9fd46d4acb5196d979b147cb.camel@xry111.site>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>,
 Jianmin lv <lvjianmin@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
From: Youling Tang <tangyouling@loongson.cn>
Message-ID: <295efdc0-388e-cda4-120c-5f9c4740b208@loongson.cn>
Date: Thu, 16 Feb 2023 16:03:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <48c4b1f81c21950e9fd46d4acb5196d979b147cb.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Bxc+U+4+1j_Gk0AA--.63148S3
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Gr43ZFW7WFW3AFy8Jw18Zrb_yoWfJwb_Xr
	yvvrWrA3WjqayUCw47Gry7G3yay3WUGr1Sq3WrKrnxu34fJF4Dur48W3ZIyF18KF4IkFWS
	yr1YvF17Cw17ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5
	_7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
	6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAK
	I48JMxAIw28IcVCjz48v1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267
	AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=



On 02/16/2023 03:10 PM, Xi Ruoyao wrote:
> On Thu, 2023-02-16 at 14:59 +0800, Jinyang He wrote:
>> +.macro la.abs reg, sym
>> +766:
>> +    nop
>> +    nop
>> +    nop
>> +    nop
>
> In the "formal" version we can code
>
> lu12i.w		reg, 0
> ori		reg, reg, 0
> lu32i.d		reg, 0
> lu52i.d		reg, reg, 0
>
> here.  Then we only need to fixup the immediate slot so we can avoid
> using parse_r.
>
>
>> +    .pushsection ".laabs", "aw", %progbits
>> +768:
>> +    .word 768b-766b
>> +    parse_r regno, \reg
>> +    .word regno
>> +    .dword \sym
>> +    .popsection
>> +.endm

I will try to modify a version for testing, using the following
definition, when the RELOCATABLE is turned on, the "la.abs macro" is
used, otherwise the "la.abs pseudo instruction" is still used as before.

#ifdef CONFIG_RELOCATABLE
.macro la.abs reg, sym
lu12i.w		reg, 0
ori		reg, reg, 0
lu32i.d		reg, 0
lu52i.d		reg, reg, 0
.endm
#endif

Youling.

