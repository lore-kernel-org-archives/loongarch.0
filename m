Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFDB812
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 01:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713316155; cv=none; b=ky2uEX5C//FOc8UAP0qGx5pLXnhopIrd7q5iHdPOYZYbavH5XyREkidEpzaQhTRbC+l8BrR2X7tgFSZ4p9Zl+HirLd/yXrLfDyB+cOz5DNeqN6kwF06l+xh8NhdnWKkax+kask71TBI3cGl//Bk0QDYDarQpd+OR6ou3tB74Ock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713316155; c=relaxed/simple;
	bh=6e1ar9zwNRxGZPT51PILThGT0Z1+J9uUvPSlF2J1dwQ=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=jYdu31IEpEqGnRulJVasDVTAsYJ/ZirZdiB83Gn/Ktbcnmcj5pTGwDpPfrRxYNnj+y3w7XVuutB7jOWgvR5OX+HOnRAwwkLha0pm6ldFsL4x6ZIkxjTAC9Q4PCk+5o2rNOkRhz8M6Oj/VPgR4hvNH6MWfZgzPL1Rdm/z9HbEMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4VK2qN5Bsvz4f3mW2
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 09:09:04 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 596F41A0CF8
	for <loongarch@lists.linux.dev>; Wed, 17 Apr 2024 09:09:09 +0800 (CST)
Received: from [10.174.176.73] (unknown [10.174.176.73])
	by APP1 (Coremail) with SMTP id cCh0CgAX6REzIR9mbcG7KA--.61033S3;
	Wed, 17 Apr 2024 09:09:09 +0800 (CST)
Subject: Re: [PATCH RFC v2 0/6] blk-throttle: support enable and disable
 during runtime
To: =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>,
 Yu Kuai <yukuai1@huaweicloud.com>
Cc: axboe@kernel.dk, chenhuacai@kernel.org, tj@kernel.org,
 josef@toxicpanda.com, jhs@mojatatu.com, svenjoac@gmx.de, raven@themaw.net,
 pctammela@mojatatu.com, qde@naccy.de, zhaotianrui@loongson.cn,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, cgroups@vger.kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
References: <20240406080059.2248314-1-yukuai1@huaweicloud.com>
 <4exmes2ilp2cmfj3evf3jhhhq6tapfzgfzuasjejrxbj6a3327@3ecptofffblf>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <f721f06e-e2c8-608e-0dd0-41f41e948f0d@huaweicloud.com>
Date: Wed, 17 Apr 2024 09:09:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <4exmes2ilp2cmfj3evf3jhhhq6tapfzgfzuasjejrxbj6a3327@3ecptofffblf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgAX6REzIR9mbcG7KA--.61033S3
X-Coremail-Antispam: 1UD129KBjvdXoWruFWfAFW7tw15tr17tFW7XFb_yoWDJFb_CF
	1Y93yxK3s5Zw48GanxKF4rWrsrWF1Igr1qq34UXFWxtr12qryxAryDAwn7Xr4UCFs0yF1v
	vr98KF4xAry29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3AFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
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

在 2024/04/16 23:56, Michal Koutný 写道:
> On Sat, Apr 06, 2024 at 04:00:53PM +0800, Yu Kuai <yukuai1@huaweicloud.com> wrote:
>> I'm planning to support build all blk-throttle polices as kernel module,
> 
> There is only one blk-throttle policy (especially after your removal of
> io.low). Did you mean blkcg policies in general?

Yes, bfq already support that, and others are all rq_qos based, they
will be much easier than blk-throtl.
> 
> The current code is complex because of various lifecycles in
> 	devices x cgroups.
> Turning policies into modules seems to make it
> 	devices x cgroups x policy modules
> .
> 
> Could you please add more info why policies as modules is beneficial,
> how to keep complexity capped?

First of all, users can only load these policies when they need, and
reduce kernel size; Then, when these policies is not loaded, IO fast
path will be slightly shorter, and save some memory overhead for each
disk.

Thanks,
Kuai

> 
> Thanks,
> Michal
> 

