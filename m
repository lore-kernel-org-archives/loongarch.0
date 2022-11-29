Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A004322A
	for <loongarch@lists.linux.dev>; Tue, 29 Nov 2022 14:22:15 +0000 (UTC)
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1p01RU-003bu3-5l; Tue, 29 Nov 2022 15:18:36 +0100
Received: from p5b13aed4.dip0.t-ipconnect.de ([91.19.174.212] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_128_GCM_SHA256
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1p01RT-003lZs-V8; Tue, 29 Nov 2022 15:18:36 +0100
Message-ID: <90b31900-11a0-a18e-0900-bde72254f472@physik.fu-berlin.de>
Date: Tue, 29 Nov 2022 15:18:34 +0100
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V2 2/3] LoongArch: cpuinfo: Fix a warning for
 CONFIG_CPUMASK_OFFSTACK
Content-Language: en-US
To: Huacai Chen <chenhuacai@gmail.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 loongarch@lists.linux.dev, linux-arch <linux-arch@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Guo Ren <guoren@kernel.org>,
 Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220714084136.570176-1-chenhuacai@loongson.cn>
 <20220714084136.570176-2-chenhuacai@loongson.cn>
 <CAAhV-H7W8V8XdJXX5FvyvvSCAbeTSgLEKhHLivm89T-Nd59Umw@mail.gmail.com>
 <28f1be2e-ca7c-1c95-535a-2099ebf607f2@physik.fu-berlin.de>
 <CAAhV-H4VEqkeXpwCmZE=VqB-TTtnteAqAxbTbeT+s38QHTGdig@mail.gmail.com>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
In-Reply-To: <CAAhV-H4VEqkeXpwCmZE=VqB-TTtnteAqAxbTbeT+s38QHTGdig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.174.212

Hi Huacai!

On 11/29/22 15:06, Huacai Chen wrote:
> On Thu, Jul 28, 2022 at 8:53 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>>
>> Hi!
>>
>> On 7/28/22 14:42, Huacai Chen wrote:
>>> Since the SH maintainer hasn't responded, I suppose it is better to
>>> let both LoongArch fix and SH fix go through your asm-generic tree?
>>
>> I could test on actual SuperH hardware if needed. CC'ing Geert who has
>> SH hardware as well.
> Any updates?

Apologies. I completely forgot about this. I will test this later this week
and report back.

Adrian

-- 
  .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
   `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

