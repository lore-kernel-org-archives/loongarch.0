Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5512CA62
	for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 01:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712973458; cv=none; b=vF/895edxErQGw/ZdfqdYxLt5widx0IPnfZCnHpnrY7VOP/maOLDzejgT8nnXTs2WjwGgdqf63vxabpZe1mnyFrHYx2IaitYqfgiLkXkvIRaJR8NIj4w+z/NVH5t5vWC6qRZqojyCbJszDLhry3+09rX3dkt0Q7y/sE5pUhqTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712973458; c=relaxed/simple;
	bh=A1e8OPRY8KILZDvW0ygBRdHsPRIXsyzd3Bp+kruNinM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jLHqlqYOnKMQpF+/VKCooRvumOggx0qtkE4duo4tWbTJo2cPrrZ3mA+5m2mEAIaGlRiXIIuuZjZaaM15yr4wqu6nfmy07mk+vaUr2wHf0FvdGg1vFiVCwiZAyAGWbmHy7CzKBN2W0gk1ZQ0nJ3XmOlhHKfTozclW4La04P6XSp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4VGc4s5xqNz4f3nTL
	for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 09:57:17 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 925E71A0572
	for <loongarch@lists.linux.dev>; Sat, 13 Apr 2024 09:57:26 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgBXKBGE5hlmiuVaJw--.14350S3;
	Sat, 13 Apr 2024 09:57:26 +0800 (CST)
Subject: Re: [PATCH RFC v2 1/6] blk-throttle: remove
 CONFIG_BLK_DEV_THROTTLING_LOW
To: Tejun Heo <tj@kernel.org>, Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, chenhuacai@kernel.org, josef@toxicpanda.com,
 jhs@mojatatu.com, svenjoac@gmx.de, raven@themaw.net, pctammela@mojatatu.com,
 qde@naccy.de, zhaotianrui@loongson.cn, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 cgroups@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 "yukuai (C)" <yukuai3@huawei.com>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <20240406080059.2248314-2-yukuai1@huaweicloud.com>
 <ZhlvqqtSo_Aw2Hjo@slm.duckdns.org>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <9edb4ff7-0094-d2b1-28e5-70daeb8b899c@huaweicloud.com>
Date: Sat, 13 Apr 2024 09:57:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZhlvqqtSo_Aw2Hjo@slm.duckdns.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgBXKBGE5hlmiuVaJw--.14350S3
X-Coremail-Antispam: 1UD129KBjvdXoW7GF1xWr15Cr18XFWUAr1xGrg_yoWDAFgEgF
	WIkr97Kw47G3WIy3WUtrs09rWqkw45GrW7X3yfXF98JFnaqas8tasxKr9xZa18CanYyrnx
	CrnxXrW2yrW7JjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kI
	c2xKxwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
	3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/

Hi,

ÔÚ 2024/04/13 1:30, Tejun Heo Ð´µÀ:
> On Sat, Apr 06, 2024 at 04:00:54PM +0800, Yu Kuai wrote:
>> From: Yu Kuai <yukuai3@huawei.com>
>>
>> One the one hand, it's marked EXPERIMENTAL since 2017, and looks like
>> there are no users since then, and no testers and no developers, it's
>> just not active at all.
>>
>> On the other hand, even if the config is disabled, there are still many
>> fields in throtl_grp and throtl_data and many functions that are only
>> used for throtl low.
>>
>> At last, currently blk-throtl is initialized during disk initialization,
>> and destroyed during disk removal, and it exposes many functions to be
>> called directly from block layer. Hence I'm planning to optimize
>> blk-throtl and finially support building it as kernel module. Remove
>> throtl low will make the work much easier.
>>
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> I haven't seen any usage but let's see if anyone complains.

Thanks for the review!
Kuai

> 
> Thanks.
> 

