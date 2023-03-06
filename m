Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D73D301
	for <loongarch@lists.linux.dev>; Mon,  6 Mar 2023 03:41:53 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8BxedmzYAVkep4IAA--.10576S3;
	Mon, 06 Mar 2023 11:40:35 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxSL2zYAVkmuhLAA--.1545S3;
	Mon, 06 Mar 2023 11:40:35 +0800 (CST)
Subject: Re: [PATCH v2] drivers: loongson: fix memory leak in
 loongson2_guts_probe
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230306025308.248987-1-dzm91@hust.edu.cn>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <d858d9eb-73f3-2b3d-1795-78d7fa4aeca3@loongson.cn>
Date: Mon, 6 Mar 2023 11:40:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230306025308.248987-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:AQAAf8BxSL2zYAVkmuhLAA--.1545S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7uFWDAw4kJryruFy3ZFyDtrb_yoW8Jw4fp3
	93AFW8uFW5JF17uFn5Ja4xWF15Ca4agF9xGF47X3W5ur9xA3W7urn3GFWUurs3ArWkC34a
	qF95KrWUGFyUu3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUFAwIDUUUU

Tested-by: Yinbo Zhu <zhuyinbo@loongson.cn>

ÔÚ 2023/3/6 ÉÏÎç10:53, Dongliang Mu Ð´µÀ:
> drivers/soc/loongson/loongson2_guts.c:150 loongson2_guts_probe()
> warn: 'guts->regs' from ioremap() not released on lines: 131,135,139,143.
>
> Fix this by modifying ioremap to devm_ioremap.
>
> Note that, this patch is not tested due to the loongson architecture.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
> v1->v2: instead of modifying error handling code, directly change
> ioremap to devm_ioremap.
>   drivers/soc/loongson/loongson2_guts.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
> index bace4bc8e03b..a053e3fdae09 100644
> --- a/drivers/soc/loongson/loongson2_guts.c
> +++ b/drivers/soc/loongson/loongson2_guts.c
> @@ -107,7 +107,7 @@ static int loongson2_guts_probe(struct platform_device *pdev)
>   	guts->little_endian = of_property_read_bool(np, "little-endian");
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	guts->regs = ioremap(res->start, res->end - res->start + 1);
> +	guts->regs = devm_ioremap(dev, res->start, res->end - res->start + 1);
>   	if (IS_ERR(guts->regs))
>   		return PTR_ERR(guts->regs);
>   

