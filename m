Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6C7F
	for <loongarch@lists.linux.dev>; Sat, 22 Apr 2023 07:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1682150381; bh=W3jNBrE3cOBdqGmcnbEzXkIy3/KNg7QMQt6FIWEW04w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JcRUKAM2JWIiST/nRlMPavJe0JmRFNWCt4gIuSkfYA9OBFzO3YNt8NXwbLehGIQRe
	 QQjJnGOy+VG7akrmzKROx/7Ubnvu62TN7wlQPoIo1INoY+BKRbmAlYzGG+f1O6JUxj
	 uZDYWyisWxyGsemb+So3bhbevnP/qqnzME2xELqM=
Received: from [192.168.9.172] (unknown [101.228.138.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 2385160106;
	Sat, 22 Apr 2023 15:59:41 +0800 (CST)
Message-ID: <ca75ac82-f8b9-edca-c916-c9bc8e7f700e@xen0n.name>
Date: Sat, 22 Apr 2023 15:59:40 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 08/12] LoongArch: Humanize the EUEN line when showing
 registers
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>
References: <20230421114908.2970567-1-kernel@xen0n.name>
 <20230421114908.2970567-9-kernel@xen0n.name>
 <CAAhV-H4nv6oY8VkOmQTs-rRntBM1WdhR9q2DpJFA_HTRggi6VA@mail.gmail.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <CAAhV-H4nv6oY8VkOmQTs-rRntBM1WdhR9q2DpJFA_HTRggi6VA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/22/23 15:16, Huacai Chen wrote:
> Hi, Xuerui,
>
> On Fri, Apr 21, 2023 at 7:49 PM WANG Xuerui <kernel@xen0n.name> wrote:
>> From: WANG Xuerui <git@xen0n.name>
>>
>> Example output looks like:
>>
>> [   xx.xxxxxx]  EUEN: 00000000 (-BTE -ASXE -SXE -FPE)
>>
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> ---
>>   arch/loongarch/kernel/traps.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/loongarch/kernel/traps.c b/arch/loongarch/kernel/traps.c
>> index 84006f1f40ed..bdd18b506bb0 100644
>> --- a/arch/loongarch/kernel/traps.c
>> +++ b/arch/loongarch/kernel/traps.c
>> @@ -206,6 +206,16 @@ static void print_prmd(unsigned long x)
>>          pr_cont(")\n");
>>   }
>>
>> +static void print_euen(unsigned long x)
>> +{
>> +       pr_cont(" EUEN: %08lx (", x);
>> +       print_bool_fragment("BTE", FIELD_GET(CSR_EUEN_LBTEN, x), true);
>> +       print_bool_fragment("ASXE", FIELD_GET(CSR_EUEN_LASXEN, x), false);
>> +       print_bool_fragment("SXE", FIELD_GET(CSR_EUEN_LSXEN, x), false);
>> +       print_bool_fragment("FPE", FIELD_GET(CSR_EUEN_FPEN, x), false);
> Please print from LSB to MSB for all CSRs, this can also makes ECode
> be displayed before ESubCode in ESTAT.
After some consideration, I think it's even more unfortunate to have all 
other CSRs printed backwards, just to make ECode appear before EsubCode. 
I'll change the ESTAT line alone in favor of keeping the display order 
of other CSRs' fields consistent with the accompanying hex notation.
-- 

WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

