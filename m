Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7BD7EA
	for <loongarch@lists.linux.dev>; Thu, 29 Jun 2023 00:34:49 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.170])
	by gateway (Coremail) with SMTP id _____8Cx5cSn0Zxk3aUDAA--.6036S3;
	Thu, 29 Jun 2023 08:34:47 +0800 (CST)
Received: from [10.20.42.170] (unknown [10.20.42.170])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxrM6m0ZxkUaIPAA--.57412S3;
	Thu, 29 Jun 2023 08:34:46 +0800 (CST)
Message-ID: <76fdc1e5-9f4b-1e5a-dbad-5214708b01f4@loongson.cn>
Date: Thu, 29 Jun 2023 08:34:46 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v15 27/30] LoongArch: KVM: Implement vcpu world switch
Content-Language: en-US
To: WANG Xuerui <kernel@xen0n.name>, zhaotianrui <zhaotianrui@loongson.cn>,
 Jinyang He <hejinyang@loongson.cn>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, loongarch@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Mark Brown <broonie@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Oliver Upton <oliver.upton@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 tangyouling@loongson.cn
References: <20230626084752.1138621-1-zhaotianrui@loongson.cn>
 <20230626084752.1138621-28-zhaotianrui@loongson.cn>
 <f648a182-7c26-5bbc-6ae5-584af26e9db1@loongson.cn>
 <7017277c-3721-b417-5215-491efae7c8a9@loongson.cn>
 <cfc87f85-3a09-8a9e-4258-4fb1fd8013ab@xen0n.name>
 <30261345-45de-8511-e285-fe16ee408ba1@loongson.cn>
 <baf5c93f-59ae-57eb-49e0-a0231dab325d@xen0n.name>
From: bibo mao <maobibo@loongson.cn>
In-Reply-To: <baf5c93f-59ae-57eb-49e0-a0231dab325d@xen0n.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxrM6m0ZxkUaIPAA--.57412S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxArWrJw13tF4fJr1xtrWUGFX_yoW5uw17pr
	1xAay3GrW5Jr1kGw1UKw4UZFySyF1xJa15Xr18XasxJ3s8Kwn2gF1jgrn09Fn3Jr48JryU
	Xr4jq3ZruF13ArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8
	JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8q2NtUUUUU==



在 2023/6/28 18:22, WANG Xuerui 写道:
> On 2023/6/28 18:11, bibo mao wrote:
>>
>>
>> 在 2023/6/28 17:51, WANG Xuerui 写道:
>>> Hi,
>>>
>>> On 2023/6/28 16:34, zhaotianrui wrote:
>>>>
>>>> 在 2023/6/28 上午11:42, Jinyang He 写道:
>>>>> On 2023-06-26 16:47, Tianrui Zhao wrote:
>>>>>
>>>>>> [snip]
>>>>>
>>>>>> +    ldx.d   t0, t1, t0
>>>>>> +    csrwr    t0, LOONGARCH_CSR_PGDL
>>>>>> +
>>>>>> +    /* Mix GID and RID */
>>>>>> +    csrrd        t1, LOONGARCH_CSR_GSTAT
>>>>>> +    bstrpick.w    t1, t1, CSR_GSTAT_GID_SHIFT_END, CSR_GSTAT_GID_SHIFT
>>>>>> +    csrrd        t0, LOONGARCH_CSR_GTLBC
>>>>>> +    bstrins.w    t0, t1, CSR_GTLBC_TGID_SHIFT_END, CSR_GTLBC_TGID_SHIFT
>>>>>> +    csrwr        t0, LOONGARCH_CSR_GTLBC
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Switch to guest:
>>>>>> +     *  GSTAT.PGM = 1, ERRCTL.ISERR = 0, TLBRPRMD.ISTLBR = 0
>>>>>> +     *  ertn
>>>>>> +     */
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Enable intr in root mode with future ertn so that host interrupt
>>>>>> +     * can be responsed during VM runs
>>>>>> +     * guest crmd comes from separate gcsr_CRMD register
>>>>>> +     */
>>>>>> +    ori    t0, zero, CSR_PRMD_PIE
>>>>> li.w t0, CSR_PRMD_PIE
>>>> Thanks for your advice, and I think it need not to replace it with "li.w" there, as it has the same meaning with "ori" instruction, and "ori" instruction is simple and clear enough. The same as the following "move" instructions. What do you think of it.
>>>
>>> Just my 2c: I'd agree that pseudo-instructions should be used wherever possible and helping readability.
>> "lu12i.w+srli.w" can be replaced by "li.w t0, KVM_GPGD"
>> we accept the suggestion two instructions should be replaced with pseudo-instruction.
>>
>> For the instruction "ori    t0, zero, CSR_PRMD_PIE"
>> what is advantage of this pseudo-instruction
>>      li.w t0, CSR_PRMD_PIE
>>
>> is "ori t0, zero, CSR_PRMD_PIE" hard to understand? It is basic arithmetic instr and easy to understand also. To be frank I do not see the advantage of using li.w, also there is no document that pseudo-instruction should be used with high priority.
> 
> It depends on the reader. Sure the semantics are the same, but with "ori xx, zero, xx" someone's always going to wonder "why do 'x = 0 | something' when you can simply li.w", because even if it's easy to understand it's still an extra level of indirection.
pseudo-instruction li.w/li.d is understandable, is there alias li.h/li.b instructions also or li is enough on LoongArch64 system?

ori $rd, $rj, imm12 can be used, however ori $rd, zero, imm12 should not be used by the description.

I guess compiler guys want to remove using zero register in assemble language, so there is pseudo instruction here. is there similar pseudo instr for "xor $rd, ZERO, $rj" and "sub $rd, ZERO, $rj" to remove zero register also?  I do not get the  documentation and consensus information for pseudo instruction usage.

Regards
Bibo Mao

> 
> And I've given the historical and general software engineering perspective too; it's not something set in stone, but I'd expect general software development best practices and minimizing any *possible* reader confusion to be acceptable.
> 

