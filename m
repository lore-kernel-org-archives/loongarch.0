Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F267C
	for <loongarch@lists.linux.dev>; Fri, 28 Jul 2023 01:13:36 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8AxFvE_FsNkxgoLAA--.27368S3;
	Fri, 28 Jul 2023 09:13:35 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxX889FsNkfrA9AA--.32888S3;
	Fri, 28 Jul 2023 09:13:34 +0800 (CST)
Message-ID: <893f8801-b36d-8146-93a6-e97b29826980@loongson.cn>
Date: Fri, 28 Jul 2023 09:13:33 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] mm/percpu: Remove some local variables in
 pcpu_populate_pte
To: Dennis Zhou <dennis@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 WANG Xuerui <kernel@xen0n.name>
References: <20230712031622.1888321-1-maobibo@loongson.cn>
 <20230712031622.1888321-2-maobibo@loongson.cn> <ZML414eLkT78bO5G@snowbird>
Content-Language: en-US
From: bibo mao <maobibo@loongson.cn>
In-Reply-To: <ZML414eLkT78bO5G@snowbird>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxX889FsNkfrA9AA--.32888S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFy3GFyfCFy8Kr15Xw4UKFX_yoW8ZrW7pr
	Z3Ga4v9F48JrnrKws3Xas8WrnxXw4rKa40k3ZrW3WrZwnIvrn7Kr4UKr13K342vFyxXF4x
	tF45JasrCa1qvacCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8r9N3UU
	UUU==



在 2023/7/28 07:08, Dennis Zhou 写道:
> Hello,
> 
> On Wed, Jul 12, 2023 at 11:16:20AM +0800, Bibo Mao wrote:
>> In function pcpu_populate_pte there are already variable defined,
>> it can be reused for later use, here remove duplicated local
>> variables.
>>
>> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
>> ---
>>  mm/percpu.c | 24 +++++++++---------------
>>  1 file changed, 9 insertions(+), 15 deletions(-)
>>
>> diff --git a/mm/percpu.c b/mm/percpu.c
>> index 28e07ede46f6..85e3f9b2a61f 100644
>> --- a/mm/percpu.c
>> +++ b/mm/percpu.c
>> @@ -3189,32 +3189,26 @@ void __init __weak pcpu_populate_pte(unsigned long addr)
>>  	pmd_t *pmd;
>>  
>>  	if (pgd_none(*pgd)) {
>> -		p4d_t *new;
>> -
>> -		new = memblock_alloc(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
>> -		if (!new)
>> +		p4d = memblock_alloc(P4D_TABLE_SIZE, P4D_TABLE_SIZE);
>> +		if (!p4d)
>>  			goto err_alloc;
>> -		pgd_populate(&init_mm, pgd, new);
>> +		pgd_populate(&init_mm, pgd, p4d);
>>  	}
>>  
>>  	p4d = p4d_offset(pgd, addr);
>>  	if (p4d_none(*p4d)) {
>> -		pud_t *new;
>> -
>> -		new = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
>> -		if (!new)
>> +		pud = memblock_alloc(PUD_TABLE_SIZE, PUD_TABLE_SIZE);
>> +		if (!pud)
>>  			goto err_alloc;
>> -		p4d_populate(&init_mm, p4d, new);
>> +		p4d_populate(&init_mm, p4d, pud);
>>  	}
>>  
>>  	pud = pud_offset(p4d, addr);
>>  	if (pud_none(*pud)) {
>> -		pmd_t *new;
>> -
>> -		new = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
>> -		if (!new)
>> +		pmd = memblock_alloc(PMD_TABLE_SIZE, PMD_TABLE_SIZE);
>> +		if (!pmd)
>>  			goto err_alloc;
>> -		pud_populate(&init_mm, pud, new);
>> +		pud_populate(&init_mm, pud, pmd);
>>  	}
>>  
>>  	pmd = pmd_offset(pud, addr);
>> -- 
>> 2.27.0
>>
> 
> I've pulled this, but the other 2 are part of loongarch and should be
> reviewed and pulled by those maintainers.
Dennis,

Thanks for your feedback.

Huacai,

Could you give some review comments about the remaining 2 patches?

Regards
Bibo Mao

> 
> Thanks,
> Dennis

