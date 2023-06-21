Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B701F9FA
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 10:15:43 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxhMTNzZJknRcAAA--.186S3;
	Wed, 21 Jun 2023 18:15:41 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx_c7KzZJkF3IAAA--.2918S3;
	Wed, 21 Jun 2023 18:15:39 +0800 (CST)
Subject: Re: [PATCH v5] selftests/clone3: Fix broken test under
 !CONFIG_TIME_NS
To: Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Christian Brauner <brauner@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
References: <1686301625-9477-1-git-send-email-yangtiezhu@loongson.cn>
Cc: linux-kselftest@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <69086c4e-501c-64a9-e7c2-4d8189ac7c05@loongson.cn>
Date: Wed, 21 Jun 2023 18:15:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1686301625-9477-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8Cx_c7KzZJkF3IAAA--.2918S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxWF1fXr43KFW7ZF47Kw1ktFc_yoW5Gw1kpF
	y8Zr4qkFZYgF17tasrZ34qgFy5G3WkJrW0krWUZ34UZr1Sgr93Xr4xKa48JFyUK3yF9rWF
	yFWfGF42g3WUJagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02
	F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GF
	ylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7Cj
	xVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r
	4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j0
	sjUUUUUU=



On 06/09/2023 05:07 PM, Tiezhu Yang wrote:
> When execute the following command to test clone3 on LoongArch:
>
>   # cd tools/testing/selftests/clone3 && make && ./clone3
>
> we can see the following error info:
>
>   # [5719] Trying clone3() with flags 0x80 (size 0)
>   # Invalid argument - Failed to create new process
>   # [5719] clone3() with flags says: -22 expected 0
>   not ok 18 [5719] Result (-22) is different than expected (0)
>
> This is because if CONFIG_TIME_NS is not set, but the flag
> CLONE_NEWTIME (0x80) is used to clone a time namespace, it
> will return -EINVAL in copy_time_ns().
>
> If kernel does not support CONFIG_TIME_NS, /proc/self/ns/time
> will be not exist, and then we should skip clone3() test with
> CLONE_NEWTIME.
>
> With this patch under !CONFIG_TIME_NS:
>
>   # cd tools/testing/selftests/clone3 && make && ./clone3
>   ...
>   # Time namespaces are not supported
>   ok 18 # SKIP Skipping clone3() with CLONE_NEWTIME
>   # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:1 error:0
>
> Fixes: 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
> v5:
>   -- Rebase on the next branch of shuah/linux-kselftest.git
>      to avoid potential merge conflicts due to changes in the link:
>      https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=f8424c54d041
>   -- Update the commit message and send it as a single patch
>
> Here is the v4 patch:
> https://lore.kernel.org/loongarch/1685968410-5412-2-git-send-email-yangtiezhu@loongson.cn/
>
>  tools/testing/selftests/clone3/clone3.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
> index e60cf4d..1c61e3c 100644
> --- a/tools/testing/selftests/clone3/clone3.c
> +++ b/tools/testing/selftests/clone3/clone3.c
> @@ -196,7 +196,12 @@ int main(int argc, char *argv[])
>  			CLONE3_ARGS_NO_TEST);
>
>  	/* Do a clone3() in a new time namespace */
> -	test_clone3(CLONE_NEWTIME, 0, 0, CLONE3_ARGS_NO_TEST);
> +	if (access("/proc/self/ns/time", F_OK) == 0) {
> +		test_clone3(CLONE_NEWTIME, 0, 0, CLONE3_ARGS_NO_TEST);
> +	} else {
> +		ksft_print_msg("Time namespaces are not supported\n");
> +		ksft_test_result_skip("Skipping clone3() with CLONE_NEWTIME\n");
> +	}
>
>  	/* Do a clone3() with exit signal (SIGCHLD) in flags */
>  	test_clone3(SIGCHLD, 0, -EINVAL, CLONE3_ARGS_NO_TEST);
>

Ping. Any more comments?

Thanks,
Tiezhu

