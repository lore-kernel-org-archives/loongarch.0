Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E49234D1C;
	Tue, 14 Jan 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736855547; cv=none; b=fZg8lO85DX31nbk4x+mVI/OGRCQEVAaiIMSpDKCc1fwn+ubOn9GhPGu0I84qV47187NtiwzQxOJEub5Yk4FM7WD2xgx0SD+vb7Vp5svZ1KQZ/2Gfc9duf3Js7D9x7nLRGbQ22uzBbJROXjlRyvzsgciVYS79jzuS7/5e/pn7DBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736855547; c=relaxed/simple;
	bh=YOX/xU89auD/UKcd+tCqe6W35N4P31nROAtyQUh9/Is=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gCLZ3/ki2in0zFIcyc3MEc+kQEpbQUjbK34aAkF68Z0fdngdpjcwxxUk8XOINESzIRt1whjqfqCpBXu8pEcL1144jiu6t5j5pRi2UDPLHR9k4/KUHXYd0wv7qdv/J/Mfcr5OE7n0EdIAjsKAsQIURVBFpklmr7YtFIoQeJUdC20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxrnP2T4ZneiljAA--.8859S3;
	Tue, 14 Jan 2025 19:52:22 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMBxReT0T4Zn2gUiAA--.2756S3;
	Tue, 14 Jan 2025 19:52:21 +0800 (CST)
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add ASSERT_BUG() macro definition
To: Huacai Chen <chenhuacai@kernel.org>
References: <20250114061507.30765-1-yangtiezhu@loongson.cn>
 <20250114061557.31120-1-yangtiezhu@loongson.cn>
 <CAAhV-H56-xQm5XnS7M4weHj29Z_bB8ZBiF_H4fd+eGe6g+naow@mail.gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1d34d05c-d408-4ee3-c385-f9367b7c3be5@loongson.cn>
Date: Tue, 14 Jan 2025 19:52:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H56-xQm5XnS7M4weHj29Z_bB8ZBiF_H4fd+eGe6g+naow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxReT0T4Zn2gUiAA--.2756S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7GF4UZw4xKw47WFyrGF15GFX_yoW8JrWfpw
	48GFyqka1DJa17KwnxKa15Xry3G3ykGFW8G34rW3s0yFyDZ39xGFn8CF4UGFW8uFW2k3WS
	qasaq39xWF4qyrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7
	I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j7189UUUUU=

On 01/14/2025 04:29 PM, Huacai Chen wrote:
> Hi, Tiezhu,
>
> On Tue, Jan 14, 2025 at 2:16 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>>
>> In order to keep the current ability for the aim of debugging and avoid
>> printing the warning message twice, add ASSERT_BUG() macro definition to
>> harden the callers of division functions.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  drivers/gpu/drm/amd/display/dc/os_types.h | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
>> index f2ba76c1e0c0..932bbe05ee0a 100644
>> --- a/drivers/gpu/drm/amd/display/dc/os_types.h
>> +++ b/drivers/gpu/drm/amd/display/dc/os_types.h
>> @@ -79,6 +79,11 @@
>>                         dc_breakpoint();        \
>>         } while (0)
>>
>> +#define ASSERT_BUG(expr) do {                  \
>> +               dc_breakpoint();                \
>> +               BUG_ON(!(expr));                \
>> +       } while (0)
> I don't think this is correct, if KGDB is enabled, then whether expr
> is true or false, ASSERT_BUG() will break to KGDB.

It should check expr first, something like this:

#define ASSERT_BUG(expr) do {                   \
                 if (!(expr)) {                  \
                         dc_breakpoint();        \
                         BUG();                  \
                 }                               \
         } while (0)

I will send v4 later.

Thanks,
Tiezhu

