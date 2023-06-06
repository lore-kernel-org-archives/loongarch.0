Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31455660
	for <loongarch@lists.linux.dev>; Tue,  6 Jun 2023 08:29:17 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxHPBb7n5k3gwAAA--.377S3;
	Tue, 06 Jun 2023 16:29:15 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxGOVZ7n5kSAUCAA--.8978S3;
	Tue, 06 Jun 2023 16:29:14 +0800 (CST)
Subject: Re: [PATCH v4 1/2] selftests/clone3: Fix broken test under
 !CONFIG_TIME_NS
To: Thomas Gleixner <tglx@linutronix.de>, Huacai Chen
 <chenhuacai@kernel.org>, Christian Brauner <brauner@kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
References: <1685968410-5412-1-git-send-email-yangtiezhu@loongson.cn>
 <1685968410-5412-2-git-send-email-yangtiezhu@loongson.cn>
 <87jzwh3swu.ffs@tglx>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <d6c79a40-18e4-1566-a5dd-6a5dcb8db04c@loongson.cn>
Date: Tue, 6 Jun 2023 16:29:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87jzwh3swu.ffs@tglx>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8DxGOVZ7n5kSAUCAA--.8978S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAw1ruFyDtF1xZr43tryfKrX_yoW5ZFyUpF
	y093ZFkFZYgry7KF97Zw4DWFWYkrn7Jr40yr1fZ34jyr1SgF1fGr47t3WrAr15Kr40y3yF
	vayxGa13ur15X3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnI
	WIevJa73UjIFyTuYvjxU7_MaUUUUU



On 06/06/2023 04:18 PM, Thomas Gleixner wrote:
> On Mon, Jun 05 2023 at 20:33, Tiezhu Yang wrote:
>> When execute the following command to test clone3 on LoongArch:
>>
>>   # cd tools/testing/selftests/clone3 && make && ./clone3
>>
>> we can see the following error info:
>>
>>   # [5719] Trying clone3() with flags 0x80 (size 0)
>>   # Invalid argument - Failed to create new process
>>   # [5719] clone3() with flags says: -22 expected 0
>>   not ok 18 [5719] Result (-22) is different than expected (0)
>>
>> This is because if CONFIG_TIME_NS is not set, but the flag
>> CLONE_NEWTIME (0x80) is used to clone a time namespace, it
>> will return -EINVAL in copy_time_ns().
>>
>> Here is the related code in include/linux/time_namespace.h:
>>
>>   #ifdef CONFIG_TIME_NS
>>   ...
>>   struct time_namespace *copy_time_ns(unsigned long flags,
>> 				      struct user_namespace *user_ns,
>> 				      struct time_namespace *old_ns);
>>   ...
>>   #else
>>   ...
>>   static inline
>>   struct time_namespace *copy_time_ns(unsigned long flags,
>> 				      struct user_namespace *user_ns,
>> 				      struct time_namespace *old_ns)
>>   {
>> 	  if (flags & CLONE_NEWTIME)
>> 		  return ERR_PTR(-EINVAL);
>>
>> 	  return old_ns;
>>   }
>>   ...
>>   #endif
>
> There is really no point in copying that code into the changelog. The
> textual explanation that it returns -EINVAL is good enough.

OK, let me remove the code in the commit message.

>> Here is the complete call stack:
>>
>>   clone3()
>>     kernel_clone()
>>       copy_process()
>>         copy_namespaces()
>>           create_new_namespaces()
>>             copy_time_ns()
>>               clone_time_ns()
>
> Uninteresting too.

Will remove it too.

>
>> If kernel does not support CONFIG_TIME_NS, /proc/self/ns/time
>> will be not exist, and then we should skip clone3() test with
>> CLONE_NEWTIME.
>
> Correct.
>
>> With this patch under !CONFIG_TIME_NS:
>>
>>   # cd tools/testing/selftests/clone3 && make && ./clone3
>>   ...
>>   # Time namespaces are not supported
>>   ok 18 # SKIP Skipping clone3() with CLONE_NEWTIME
>>   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:1 error:0
>
>> Fixes: 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  tools/testing/selftests/clone3/clone3.c | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
>> index e495f89..c721f8a 100644
>> --- a/tools/testing/selftests/clone3/clone3.c
>> +++ b/tools/testing/selftests/clone3/clone3.c
>> @@ -196,7 +196,12 @@ int main(int argc, char *argv[])
>>  			CLONE3_ARGS_NO_TEST);
>>
>>  	/* Do a clone3() in a new time namespace */
>> -	test_clone3(CLONE_NEWTIME, 0, 0, CLONE3_ARGS_NO_TEST);
>> +	if (access("/proc/self/ns/time", F_OK) == 0) {
>> +		test_clone3(CLONE_NEWTIME, 0, 0, CLONE3_ARGS_NO_TEST);
>> +	} else {
>> +		ksft_print_msg("Time namespaces are not supported\n");
>> +		ksft_test_result_skip("Skipping clone3() with CLONE_NEWTIME\n");
>> +	}
>
> Patch looks good otherwise.

Thank you, I will send v5 on Friday with updated commit message
if no more comments.

Thanks,
Tiezhu

