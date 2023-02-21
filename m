Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF632110D
	for <loongarch@lists.linux.dev>; Tue, 21 Feb 2023 06:46:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8AxII+8aPRj7hADAA--.761S3;
	Tue, 21 Feb 2023 14:46:20 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx6r28aPRjlJE3AA--.35902S3;
	Tue, 21 Feb 2023 14:46:20 +0800 (CST)
Message-ID: <7d6125dd-29e8-14d8-b1d7-d8c14d7bec80@loongson.cn>
Date: Tue, 21 Feb 2023 14:46:20 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 05/29] LoongArch: KVM: Add vcpu related header files
Content-Language: en-US
To: Xi Ruoyao <xry111@xry111.site>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>
References: <20230220065735.1282809-1-zhaotianrui@loongson.cn>
 <20230220065735.1282809-6-zhaotianrui@loongson.cn>
 <497693ca2cbc443c1d9f796c3aace6c9987bec72.camel@xry111.site>
From: maobibo <maobibo@loongson.cn>
In-Reply-To: <497693ca2cbc443c1d9f796c3aace6c9987bec72.camel@xry111.site>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx6r28aPRjlJE3AA--.35902S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvdXoW7Xr18GFyrJr15tw4rtF1kZrb_yoWkKFg_Aw
	4UGr17Zr15Jw48Jw1UGr15Zr9rJr4jvr1UJw45Ar17Jw1UJrs5Jrn8A3s5AryUGw4xJrnr
	Gr15J3W3tF1UXjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrn0
	xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUO
	07kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3w
	AFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK
	6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7
	xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAa
	w2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
	AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcpBTUUUUU



在 2023/2/21 12:44, Xi Ruoyao 写道:
> On Mon, 2023-02-20 at 14:57 +0800, Tianrui Zhao wrote:
>> +/* GCSR */
>> +static inline u64 gcsr_read(u32 reg)
>> +{
>> +       u64 val = 0;
>> +
>> +       asm volatile (
>> +               "parse_r __reg, %[val]\n\t"
>> +               ".word 0x5 << 24 | %[reg] << 10 | 0 << 5 | __reg\n\t"
> 
> Don't do this.  You should add the instruction to binutils first, then
> make CONFIG_KVM depend on the assembler supporting this instruction. 
> This is completely unreadable and only fine for an internal PoC.

We are preparing to submit these instruction support for binutils,
however it is still necessary. Supposing that it is supported in future
gcc version, we can not drop existing gcc 12/13 supporting to compiling
kernel with LoongArch architecture.

Maybe there will be human readable code like this:
#if GCC_SUPPORT_KVM_INSTR
  ...
#else
  asm volatile (".word   "
  ...
#endif

Regards
Bibo, Mao
> 
>> +               : [val] "+r" (val)
>> +               : [reg] "i" (reg)
>> +               : "memory");
>> +
>> +       return val;
>> +}
> 

