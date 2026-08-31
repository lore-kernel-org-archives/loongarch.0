Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3DC4DBD8E
	for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183608; cv=none; b=mG6AMu7KafwNxgnIEXk56zqzt7J0P7rLS4uwQIaS+NH+sfTfq5JR9oWzOKtT4/G3+sIWcWpubcUYK3w8KYHIxuu2ARbzo28CSdID7MNdxzti/9kw5T5HrogIQH4/NZ9qQdHvzbfTjaUiGHfwngus7EZZKkbHtuCklVt1Nhcf/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183608; c=relaxed/simple;
	bh=rE7h8zbq53OFhYYydlfuTPoMOMrAbYTIIR6UWRulbHQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RozrUCa3eEeXLM+T3RC6APlL7kGm+re4NMQWJ16UX+QbfMpj/ipHLHZQPa7ayY8Hio29idABeP9UwdNcJUpqqz6wMCYKUIMvsOx+GBcQiL4KvvDUgqvM3olZmjjUhkq1ZDoS3mA2mwbSf4/9xgXBlVBcn4CktKLVQCz71cmK7Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnxr27RY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnxr27RY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso38711995ad.3
        for <loongarch@lists.linux.dev>; Mon, 31 Aug 2026 06:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183605; x=1788788405; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=53920xzB8XLNSjeZIZbkJ3m9LVbpBiAgUUyw5Vt5WJg=;
        b=Vnxr27RYDz0vIOFnWRMuInbfQi2tUdU1MmjNRbTBeF+PfsJDUMWZvGVajbK5czsPIE
         omQLAgQEARc4di+gfzTkk1hLc2ne99cSLhMpU/bGFesmsiEt/EEPvWcKEF3c4lotYqdT
         LYMUCEwGBsZkR4AcVevhfa+YcJuDBeD+OaXMM6S3+bGWZQ/hgu7M2j94jDAerhPcuQMv
         mYHlKHwfKfa+kfqufDR+ORAkNhgBiJ5Jr4oSRNUP9KdafM+wIciSys/srM3jidlSdvZF
         RVBRIFJuToJggByQtrpi+VQnMUWK55wzGuY/pUPX4Y+WE39Z2QgKGm3ArrkkLfm/agCR
         NLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183605; x=1788788405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=53920xzB8XLNSjeZIZbkJ3m9LVbpBiAgUUyw5Vt5WJg=;
        b=HfS1hBVmHCjfSMXEXYJz3dcYfAyc+ET6KGIBlitvJqCiikJiVg0G2MKuMFHe7/Cs/1
         51Dw4mWk1Yt5GRv+/SUDEBSzt0uaEdwAJ/i7fZHUbNhgnDEdxYMxtIT9My6RbdmpeRYh
         BbXIgXzyhClgPVkbH1nNrncKilsvO6BR82S56oqCIMfskH6X+vLXdKEFQlY1J4qclZU0
         ACk6tSH6n7sMFTfi60sXNC2RcTTqHfvr4GpwHOUfbwtBHLgx73igwUOQc/j9EW9wfwMP
         JeDLRqgAX2pEY+0T+p4/RXiEy5lRvT9vS0egGCo3OpR4vueMJQTfdnRw9F6LZfkNK4+c
         ntVA==
X-Forwarded-Encrypted: i=1; AKwUvBxsNAB55NdwRo4tilGe9s8WZG/ggxGemGaGNx3sDXytq3miAYaF2Idkp9HdyyvX/eeiDFWtqbkhB6s=@lists.linux.dev
X-Gm-Message-State: AFuF++mjWbk9+mW48494K6Gss6h+tuYL37xQ+ewsMu3FcTrOksqmYi5B
	oNIqvTp9hhfNEGLag0XYfQB6/6Bgu2ikYz7/3Ij3HDAmDN+njIuZGc7N
X-Gm-Gg: AYBFou3kfkthhNir7bV9sJX440qYmR+z52OvX12oOIvv5PJALZjYYVC4u76g/1TSR1q
	SN05WUp+Ea3Zg8fmPO+7CBIkEwi+E5zIpBek0PBI5NqonGuZaVR6g/8sY3kOzjaxNUodBQexThm
	PN4PxjLRAUtlBbvd2lJqp1/+k/k5VRzd1BD8V1lbFSz2zOjno8EzKDpgwNh8ZUm6/3f93c53JVZ
	Yh3ZKw6f3zfis5x6iPLQbJTMuVsB4tVQtvlNFD0jHxM7vEV4eAX9eHIxjNF3J4kJlPHnRNODohn
	4P/b60fjun5pWf/ZcuyTGgxLzxywERApZVF2yY8LT4EFXCT1Wbd7mkgMbtzdLy8oTTSuZNx7Rbx
	k7ZWk4hGVj9Om04kn+x43E7fTahGjqLM6WrpDQUb8UXlL/dduuYONcIA07crkGZw9aSI45H9pLr
	T65iO44SQ2pOYjmDNL5CEBaqpJH9WwYQpkIpcloVFGnk38FJC6g4DJpQ==
X-Received: by 2002:a17:902:ce88:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2d74dca2281mr379634065ad.2.1788183605112;
        Mon, 31 Aug 2026 06:40:05 -0700 (PDT)
Received: from localhost ([45.112.44.97])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa20e2fsm30550306eec.28.2026.08.31.06.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:40:04 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 31 Aug 2026 21:36:33 +0800
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, 
	hpa@zytor.com, akpm@linux-foundation.org, baoquan.he@linux.dev, rppt@kernel.org, 
	pasha.tatashin@soleen.com, pratyush@kernel.org, ruirui.yang@linux.dev, kees@kernel.org, 
	thuth@redhat.com, gshan@redhat.com, jic23@kernel.org, james.morse@arm.com, 
	ardb@kernel.org, leitao@debian.org, yeoreum.yun@arm.com, tangyouling@kylinos.cn, 
	hbathini@linux.ibm.com, adityag@linux.ibm.com, ionut.nechita@windriver.com, 
	liaoyuanhong@vivo.com, seanjc@google.com, fuqiang.wang@easystack.cn, makb@juniper.net, 
	piliu@redhat.com, ebiggers@kernel.org, jbouron@amazon.com, mclapinski@google.com, 
	me@linux.beauty, graf@amazon.com, bgwin@google.com, robh@kernel.org, 
	takahiro.akashi@linaro.org, palmer@rivosinc.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v3 07/17] crash_dump: Fix potential double-free of
 keys_header
Message-ID: <apWDDWhkVMIpKWS-@Rk>
References: <20260826092541.3905933-1-ruanjinjie@huawei.com>
 <20260826092541.3905933-8-ruanjinjie@huawei.com>
 <87186b8a-f68c-400b-97cf-8ea6129eba69@linux.ibm.com>
 <fecbe6ee-12e3-4f3d-94ac-eb7cd08eeb0d@huawei.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fecbe6ee-12e3-4f3d-94ac-eb7cd08eeb0d@huawei.com>

On Mon, Aug 31, 2026 at 09:24:07AM +0800, Jinjie Ruan wrote:
>
>
>在 2026/8/30 13:59, Sourabh Jain 写道:
>> Hello Jinjie,
>>
>> Coiby is handling this issue in the below patch series:
>> https://lore.kernel.org/all/20260828084900.1496839-2-coiby.xu@gmail.com/
>>
>> Since the above patch series is all about crash_load_dm_crypt_keys,
>> could you
>> please consider dropping this patch from your series and reviewing his
>> patch
>> instead?
>
>Absolutely, happy to do so — I'll drop this patch and review Coiby's
>series instead.

Hi Jinjie,

Thank you for agreeing to drop your patch and review mine instead!

>
>>
>> Thanks,
>> Sourabh Jain
>>
>> On 26/08/26 14:55, Jinjie Ruan wrote:
>>> `keys_header` was freed in `build_keys_header()` without being reset
>>> to NULL, and the error path in `crash_load_dm_crypt_keys()` freed it
>>> unconditionally even when reused, leading to double-free or
>>> use-after-free.
>>>
>>> Add `free_keys_header()` to centralize freeing and NULL-setting.
>>> Use it in `build_keys_header()` and only free in the error path when
>>> the header was newly built (`!is_dm_key_reused`).
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: Baoquan He <bhe@redhat.com>
>>> Cc: Mike Rapoport <rppt@kernel.org>
>>> Cc: Pasha Tatashin <pasha.tatashin@soleen.com>
>>> Cc: Pratyush Yadav <pratyush@kernel.org>
>>> Cc: Dave Young <ruirui.yang@linux.dev>
>>> Cc: stable@vger.kernel.org
>>> Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump
>>> kernel")
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>   kernel/crash_dump_dm_crypt.c | 15 +++++++++++----
>>>   1 file changed, 11 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
>>> index c685497cd470..ed0960ff0987 100644
>>> --- a/kernel/crash_dump_dm_crypt.c
>>> +++ b/kernel/crash_dump_dm_crypt.c
>>> @@ -363,15 +363,21 @@ static struct configfs_subsystem
>>> config_keys_subsys = {
>>>       },
>>>   };
>>>   +static void free_keys_header(void)
>>> +{
>>> +    if (keys_header) {
>>> +        kvfree(keys_header);
>>> +        keys_header = NULL;
>>> +    }
>>> +}
>>> +
>>>   static int build_keys_header(void)
>>>   {
>>>       struct config_item *item = NULL;
>>>       struct config_key *key;
>>>       int i, r;
>>>   -    if (keys_header != NULL)
>>> -        kvfree(keys_header);
>>> -
>>> +    free_keys_header();
>>>       keys_header = kzalloc(get_keys_header_size(key_count), GFP_KERNEL);
>>>       if (!keys_header)
>>>           return -ENOMEM;
>>> @@ -441,7 +447,8 @@ int crash_load_dm_crypt_keys(struct kimage *image)
>>>       r = kexec_add_buffer(&kbuf);
>>>       if (r) {
>>>           pr_err("Failed to call kexec_add_buffer, ret=%d\n", r);
>>> -        kvfree((void *)kbuf.buffer);
>>> +        if (!is_dm_key_reused)
>>> +            free_keys_header();
>>>           return r;
>>>       }
>>>       image->dm_crypt_keys_addr = kbuf.mem;
>>
>

-- 
Best regards,
Coiby
