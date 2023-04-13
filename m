Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF25393
	for <loongarch@lists.linux.dev>; Thu, 13 Apr 2023 01:55:06 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxJPz5YDdkNpEbAA--.42581S3;
	Thu, 13 Apr 2023 09:55:05 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxfb73YDdkVrkhAA--.62505S3;
	Thu, 13 Apr 2023 09:55:04 +0800 (CST)
Subject: Re: [PATCH v1 1/4] LoongArch: Move three functions from kprobes.c to
 inst.h
To: Xi Ruoyao <xry111@xry111.site>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
References: <1681293901-24918-1-git-send-email-yangtiezhu@loongson.cn>
 <1681293901-24918-2-git-send-email-yangtiezhu@loongson.cn>
 <6d06f74cb610b0012ff367fd1a7ac4aba027e304.camel@xry111.site>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <c69eb8f4-3054-17f2-f0b4-860208509ca6@loongson.cn>
Date: Thu, 13 Apr 2023 09:55:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <6d06f74cb610b0012ff367fd1a7ac4aba027e304.camel@xry111.site>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cxfb73YDdkVrkhAA--.62505S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWrKr48Xr1kuw1ktrykWw43Awb_yoW8Jr4UpF
	WUCa1UGFs7Ja48Jr4DJws5Ar1Fqr4ftry7AryUt3y5JFyqkrWftFyFk3y2kasY9342krW2
	vay5AF17uw13Aa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
	xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
	GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
	8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
	MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
	8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j0FALUUUUU=



On 04/12/2023 06:39 PM, Xi Ruoyao wrote:
> On Wed, 2023-04-12 at 18:04 +0800, Tiezhu Yang wrote:
>> +static inline bool insns_not_supported(union loongarch_instruction insn)
>
> This function seems long enough (to me) not to use "static inline".
> Note that most part of this function belongs to a cold path, and IMO
> it's bad to inline a cold path into every caller.

OK, I will move the three functions from kprobes.c to inst.c.

>
>> +{
>> +       switch (insn.reg2i14_format.opcode) {
>> +       case llw_op:
>> +       case lld_op:
>> +       case scw_op:
>> +       case scd_op:
>> +               pr_notice("kprobe: ll and sc instructions are not supported\n");
>> +               return true;
>> +       }
>> +
>> +       switch (insn.reg1i21_format.opcode) {
>> +       case bceqz_op:
>> +               pr_notice("kprobe: bceqz and bcnez instructions are not supported\n");
>> +               return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>> +static inline bool insns_need_simulation(union loongarch_instruction insn)
>> +{
>> +       if (is_pc_ins(&insn))
>> +               return true;
>> +
>> +       if (is_branch_ins(&insn))
>> +               return true;
>> +
>> +       return false;
>
> I'd write "return is_pc_ins(&insn) || is_branch_ins(&insn);" here, but
> there is no behavioral difference anyway.

I prefer leave it as it is.

Thanks,
Tiezhu

