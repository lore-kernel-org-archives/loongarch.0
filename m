Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FBF1E3DDB
	for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 02:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757643977; cv=none; b=RJW55BFgQVYlvCgSnPcpjBt/wHLhBhCOoBT7XqNo582tL0C40+TnHrqCnVryel6tRNaEAFasb9p9oK5w8EMRu+pMQ0UQ0J2a3iY5mEsPHjdzTjgAPNeys3GEB4CKnt1ImPnFdvLw/idQPPxuzANu+LOagXwYzOMNqAM5MSMAaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757643977; c=relaxed/simple;
	bh=v4ZnAAgRrIZoT2rwuee+YKSyMUXAE5UC6+NNSIG6dHk=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=V6NWj33zSturaZDkPjXf9BpYchy6ImdqFtYprJSHhQxy5LKJn/+BFKpgTykCPadkL38Ih98f4iC1+L9O5g0dvI9pTzDAegf95/jPpTwPsnXoRlrXwDJD+9KsWkzzbacr6JRjmZeVBh0P4eExWPPxQrgtNDM195uH6hQQCRL5sO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxG9K+hMNoKHgJAA--.19726S3;
	Fri, 12 Sep 2025 10:26:06 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxQ+S9hMNoYVmPAA--.64958S3;
	Fri, 12 Sep 2025 10:26:05 +0800 (CST)
Subject: Re: [PATCH v1 1/2] livepatch: Add config LIVEPATCH_DEBUG to get debug
 information
To: Miroslav Benes <mbenes@suse.cz>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Xi Zhang <zhangxi@kylinos.cn>,
 live-patching@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250909113106.22992-1-yangtiezhu@loongson.cn>
 <20250909113106.22992-2-yangtiezhu@loongson.cn>
 <alpine.LSU.2.21.2509111549200.29971@pobox.suse.cz>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8dcdba05-4d8c-83ff-f337-b6e71546e1a0@loongson.cn>
Date: Fri, 12 Sep 2025 10:26:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2509111549200.29971@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxQ+S9hMNoYVmPAA--.64958S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JF1fZFyfZFW7CrW5ZFy5trc_yoWDGwbEyr
	1xuwnrWa1UuFyq9a1fWr4avFWktw1kWryDXrn3ZryYvryqgFy5JrZYkF9IgrWrJrWjvF4D
	Kan5JFs3JryjgosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbI
	xvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU
	=

On 2025/9/11 下午9:50, Miroslav Benes wrote:
> Hi,
> 
> On Tue, 9 Sep 2025, Tiezhu Yang wrote:
> 
>> Add config LIVEPATCH_DEBUG and define DEBUG if CONFIG_LIVEPATCH_DEBUG
>> is set, then pr_debug() can print a debug level message, it is a easy
>> way to get debug information without dynamic debugging.
> 
> I do not have a strong opinion but is it really worth it? Configuring

This is an alternative way, there are some similar usages:

drivers/iommu/exynos-iommu.c:
#ifdef CONFIG_EXYNOS_IOMMU_DEBUG
#define DEBUG
#endif

drivers/mtd/nand/raw/s3c2410.c:
#ifdef CONFIG_MTD_NAND_S3C2410_DEBUG
#define DEBUG
#endif

drivers/usb/storage/usb.c:
#ifdef CONFIG_USB_STORAGE_DEBUG
#define DEBUG
#endif

> dynamic debug is not difficult, it is more targetted (you can enable it
> just for a subset of functions in livepatch subsystem) and it can also be
> done on the command line.

Yes, this is true. It is up to the maintainers to apply this patch
or not.

Thanks,
Tiezhu

