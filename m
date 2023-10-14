Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7300E1106
	for <loongarch@lists.linux.dev>; Sat, 14 Oct 2023 03:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxueqfDSplKe0xAA--.20683S3;
	Sat, 14 Oct 2023 11:40:15 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx7tyeDSplbswjAA--.10433S3;
	Sat, 14 Oct 2023 11:40:14 +0800 (CST)
Subject: Re: [PATCH v2 4/8] objtool/LoongArch: Enable orc to be built
To: Huacai Chen <chenhuacai@kernel.org>
References: <1696856590-30298-1-git-send-email-yangtiezhu@loongson.cn>
 <1696856590-30298-5-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H6bKnCjjbD=ghJvjYkD4vnMsUNzataMV965zvO=vzQf5Q@mail.gmail.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <5f31f8e9-75ad-4cb8-5998-dc9c8d00c70f@loongson.cn>
Date: Sat, 14 Oct 2023 11:40:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6bKnCjjbD=ghJvjYkD4vnMsUNzataMV965zvO=vzQf5Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx7tyeDSplbswjAA--.10433S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF45Xw4fCryUXw47Gw1rAFc_yoWfAFb_Wr
	n2yr1DGr1UuFnxC3ZIkayUZFyDt3W5Xa17Gay8ursrXrn3JrWF9FWkurn3ur4rJ3y3CF4D
	ur1vyFy5CF1DWosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUU
	UUU==



On 10/10/2023 08:52 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Mon, Oct 9, 2023 at 9:03 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> Implement arch-specific init_orc_entry(), reg_name(), orc_type_name(),
>> print_reg() and orc_print_dump(), then set BUILD_ORC as y to build the
>> orc related files.

...

>> +#define ORC_REG_SP                     2
>> +#define ORC_REG_BP                     3
> There is no BP register for LoongArch, so I think all 'BP' should be
> 'FP' in this patch.

Makes sense, thank you, will do it.

>> +#define ORC_REG_MAX                    4

...

>> +struct orc_entry {
>> +       s16             sp_offset;
>> +       s16             bp_offset;
>> +       s16             ra_offset;
>> +       unsigned int    sp_reg:4;
>> +       unsigned int    bp_reg:4;
>> +       unsigned int    ra_reg:4;
>> +       unsigned int    type:3;
>> +       unsigned int    signal:1;
>> +};

At the same time, I will replace bp_offset with fp_offset and
replace bp_reg with fp_reg, then modify the related code.

Thanks,
Tiezhu

