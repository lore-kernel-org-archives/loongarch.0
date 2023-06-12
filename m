Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525D8EC3
	for <loongarch@lists.linux.dev>; Mon, 12 Jun 2023 02:38:55 +0000 (UTC)
Received: from loongson.cn (unknown [10.180.13.22])
	by gateway (Coremail) with SMTP id _____8CxOuo+hYZkeGQDAA--.7584S3;
	Mon, 12 Jun 2023 10:38:54 +0800 (CST)
Received: from [10.180.13.22] (unknown [10.180.13.22])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxauU+hYZkgcYUAA--.60237S3;
	Mon, 12 Jun 2023 10:38:54 +0800 (CST)
Message-ID: <2997ad32-66e2-3aac-2b8f-ab47c5d98d61@loongson.cn>
Date: Mon, 12 Jun 2023 10:38:28 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: Add support for Loongson audio
 card
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn
References: <20230605120934.2306548-1-mengyingkun@loongson.cn>
 <20230605120934.2306548-3-mengyingkun@loongson.cn>
 <118d13ef-a247-cf88-5084-afdebc6b7651@kernel.org>
 <9fb3da48-a20b-4e2f-b84a-733f96126ebe@sirena.org.uk>
From: Yingkun Meng <mengyingkun@loongson.cn>
In-Reply-To: <9fb3da48-a20b-4e2f-b84a-733f96126ebe@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:AQAAf8AxauU+hYZkgcYUAA--.60237S3
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQAADGSFuYEEPAABst
X-Coremail-Antispam: 1Uk129KBj9xXoW7Jw4DGr1fGry3GF1fCryDurX_yoW3GFb_Cw
	4IqF4kC3yUJFnrXrZagr1UZ3sF9F1qyr9rXrWrGF1DX345tayv9FnrCr13JwnYq3yrGFWD
	uw1Yqr18Zw1avosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb-xYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
	0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
	aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
	xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xF
	xVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWw
	C2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_
	Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJV
	WUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIY
	CTnIWIevJa73UjIFyTuYvjxUcsjjDUUUU


On 2023/6/5 23:06, Mark Brown wrote:
> On Mon, Jun 05, 2023 at 04:45:38PM +0200, Krzysztof Kozlowski wrote:
>> On 05/06/2023 14:09, YingKun Meng wrote:
>>> +title: Loongson generic ASoC audio sound card.
>> What is a "generic audio card"? Does it even match hardware? Bindings
>> are supposed to describe hardware, which is usually very specific.
> The concept of a generic, reusable sound card seems reasonably clear -
> there's a bunch of in tree examples already and the idea that we have to
> pull together multiple bits of hardware to make a useful sound subsystem
> is a known thing.
>
>> Also: Drop full stop. It's a title.
> Shouldn't this be checked by the tooling?


All work will be done in the new version.


Thanks,
Yingkun Meng

