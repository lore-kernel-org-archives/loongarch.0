Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BFC65B
	for <loongarch@lists.linux.dev>; Thu, 12 Oct 2023 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxHOuWUidlGjsxAA--.24662S3;
	Thu, 12 Oct 2023 09:57:42 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxeuSTUidlFTghAA--.6471S3;
	Thu, 12 Oct 2023 09:57:39 +0800 (CST)
Subject: Re: [PATCH v6] selftests/clone3: Fix broken test under
 !CONFIG_TIME_NS
To: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
References: <1689066814-13295-1-git-send-email-yangtiezhu@loongson.cn>
 <0560a851-5e8c-d82a-8445-a16a92b967c9@loongson.cn>
Cc: linux-kselftest@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn,
 Andrew Morton <akpm@linux-foundation.org>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <1c3a0544-d7fe-1a34-e61a-2f06f5758a81@loongson.cn>
Date: Thu, 12 Oct 2023 09:57:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0560a851-5e8c-d82a-8445-a16a92b967c9@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8CxeuSTUidlFTghAA--.6471S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uw1fZrW7Kr4kury5tw1DurX_yoW8Gr47pF
	W8ZF4UKFs5W347Aa9rG34DWFy5tws5JFy8ZFW8Z3srJryrX3ZYqr48Ka48uFyjgr1vv34F
	y3WxGFs8uF1UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUP2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_
	WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
	CYjI0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUU
	U==

Cc: Andrew Morton <akpm@linux-foundation.org>

On 08/17/2023 03:22 PM, Tiezhu Yang wrote:
> Hi Shuah,
>
> On 07/11/2023 05:13 PM, Tiezhu Yang wrote:
>> When execute the following command to test clone3 under !CONFIG_TIME_NS:
>>
>>   # make headers && cd tools/testing/selftests/clone3 && make && ./clone3
>>
>> we can see the following error info:
>>
>>   # [7538] Trying clone3() with flags 0x80 (size 0)
>>   # Invalid argument - Failed to create new process
>>   # [7538] clone3() with flags says: -22 expected 0
>>   not ok 18 [7538] Result (-22) is different than expected (0)
>>   ...
>>   # Totals: pass:18 fail:1 xfail:0 xpass:0 skip:0 error:0
...
>>
>> Fixes: 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>
>> v6: Rebase on 6.5-rc1 and update the commit message
>>
>>  tools/testing/selftests/clone3/clone3.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>
> Hi Shuah,
>
> Any comments? I guess this should go through the linux-kselftest tree.
>
> Thanks,
> Tiezhu
>

What is the status of this patch?

https://lore.kernel.org/lkml/1689066814-13295-1-git-send-email-yangtiezhu@loongson.cn/

This is a ping message, maybe you have forgot them?

Thanks,
Tiezhu

