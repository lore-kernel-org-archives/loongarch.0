Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BFCD7C
	for <loongarch@lists.linux.dev>; Fri, 16 Jun 2023 06:06:34 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8BxLuvo+4tkjdsFAA--.12696S3;
	Fri, 16 Jun 2023 14:06:32 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTMrm+4tkLfAcAA--.7600S3;
	Fri, 16 Jun 2023 14:06:31 +0800 (CST)
Subject: Re: [PATCH v3 1/3] loongarch: export some arch-specific pm interfaces
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 Jianmin Lv <lvjianmin@loongson.cn>, wanghongliang@loongson.cn,
 Liu Peibao <liupeibao@loongson.cn>, loongson-kernel@lists.loongnix.cn,
 zhuyinbo@loongson.cn
References: <20230615091757.24686-1-zhuyinbo@loongson.cn>
 <20230615091757.24686-2-zhuyinbo@loongson.cn>
 <CAAhV-H5XxxGd_+NMRJKUCtk24dBQF0Fzdsg_5mZEWh1hs_u0qg@mail.gmail.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <437633c4-b5fc-6e6d-2711-f2abd420936b@loongson.cn>
Date: Fri, 16 Jun 2023 14:06:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5XxxGd_+NMRJKUCtk24dBQF0Fzdsg_5mZEWh1hs_u0qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxTMrm+4tkLfAcAA--.7600S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==



在 2023/6/16 下午12:04, Huacai Chen 写道:
> Hi, Yinbo,
> 
> I think this patch should go through the loongarch tree and the others
> to go through the soc tree, so I just applied this one. The next
> version you can only send the other two, thanks. 


okay, I got it.

Thanks,
Yinbo

