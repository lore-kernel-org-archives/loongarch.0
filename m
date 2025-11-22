Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C009D13AA2F
	for <loongarch@lists.linux.dev>; Sat, 22 Nov 2025 11:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763810829; cv=none; b=o3bNMd5GmTq2REbdsxdHTQNGxNAAlPopYtayxnxMmnTFzmsGiSx8liMTgL5f/ggTZ+bTmr3UEoWjDO4wExWH74p4gC9fM3mOZtlt/x1HymSlqRP1muasyht1fdCtDyZ80dVGIBG5s7Qq3yOkedLn4ECIlkcb3G1XZ2+1HRnAejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763810829; c=relaxed/simple;
	bh=PdKae5AjMVZitRaBXKL1kJYtGQ3efsdJlfub/gHe9PE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PA3VsE3pRfZHKUNC9cdG2cU89u9faXUVPhc/+44J6KwXz34aAuDFw9kw5PzqIh8Z3sOK59TlUL0jCu6eZKrIJJ8Ka9jJ7L910qgnunnrQzWZT5a/JDeK6Eg5UAVH5vNMN2at8dS684bX0t+Ncc6b9MrhDgFdZZMzyXfnI/OBltM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [36.44.121.68])
	by gateway (Coremail) with SMTP id _____8CxaNEEniFpM+4mAA--.18922S3;
	Sat, 22 Nov 2025 19:27:00 +0800 (CST)
Received: from [192.168.0.111] (unknown [36.44.121.68])
	by front1 (Coremail) with SMTP id qMiowJAxvsH8nSFpm+g7AQ--.53718S3;
	Sat, 22 Nov 2025 19:26:57 +0800 (CST)
Message-ID: <7f179e5f-610c-6468-cb3f-17d25d096a8f@loongson.cn>
Date: Sat, 22 Nov 2025 19:26:52 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] kbuild: Add KBUILD_VMLINUX_LIBS_PRELINK
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-efi@vger.kernel.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251119042708.27658-1-yangtiezhu@loongson.cn>
 <20251122013551.GA3928114@ax162>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
In-Reply-To: <20251122013551.GA3928114@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJAxvsH8nSFpm+g7AQ--.53718S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AFWxury5KFWUGFW7Gr17Jwc_yoW8GFW5pa
	1vyr4jvFsrJw4vqan7C345Xa1YqF95XrWxWFyDKa98Z3yDXr10vrZFgF43ZF9FvFyDAF4S
	gFs7XF9xCry7K3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
	AYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jnUUUU
	UUUU=

On 11/22/25 09:35, Nathan Chancellor wrote:
> On Wed, Nov 19, 2025 at 12:27:08PM +0800, Tiezhu Yang wrote:
> ...
>> index 433849ff7529..e72d3254b93f 100755
>> --- a/scripts/link-vmlinux.sh
>> +++ b/scripts/link-vmlinux.sh
>> @@ -61,12 +61,11 @@ vmlinux_link()
>>   	shift
>>   
>>   	if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
>> -		# Use vmlinux.o instead of performing the slow LTO link again.
> 
> Why is this comment getting removed?

When using KBUILD_VMLINUX_LIBS_PRELINK or KBUILD_VMLINUX_LIBS_FINAL,
drivers/firmware/efi/libstub/lib.a needs to be linked to the final
vmlinux with vmlinux.o, so I thought the above comment is not proper,
it I misunderstood it, I will keep the comment as is.

>>   		objs=vmlinux.o
>> -		libs=
>> +		libs="${KBUILD_VMLINUX_LIBS_PRELINK}"
>>   	else
>>   		objs=vmlinux.a
>> -		libs="${KBUILD_VMLINUX_LIBS}"
>> +		libs="${KBUILD_VMLINUX_LIBS} ${KBUILD_VMLINUX_LIBS_PRELINK}"
>>   	fi
>>   
>>   	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then

FYI, the previous patch is still under discussion yesterday [1],
I do not know whether this patch is necessary and what is the next
step [2].

[1] 
https://lore.kernel.org/loongarch/CAAhV-H4AasfFet_Gi_mVyte3RPMH3qBS73dBfF-=Gd7HJ6ZPEw@mail.gmail.com/
[2] 
https://lore.kernel.org/loongarch/39617a3e-c476-abac-8425-bbcece769cdb@loongson.cn/

Thanks,
Tiezhu

