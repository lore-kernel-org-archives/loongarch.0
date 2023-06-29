Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7362565;
	Thu, 29 Jun 2023 13:03:50 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 76C082B000EC;
	Thu, 29 Jun 2023 09:03:46 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 29 Jun 2023 09:03:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1688043826; x=1688051026; bh=UU
	HaYOR2mXOloOMHF3WLMCOR1A2U5vkl9suJPqtiWo0=; b=jYmdjI83UYYyF7IY+u
	8g9McVnE3vPyh7glSNzH+p2DdU5ryP8UZ/cxpvpQF5S/pn4dHU1j+Mx0d5HMNkn0
	Imm+u93oB5rHRaIXBems4pxGAHK7VFPs1bNA9+d8EbLLjt1VNLigUVjHvoO5eoXB
	lZyoP+XGxZQJ0trrINfRRc458VkK3D9Fs236LXlJaZwBV0f7KjN5QHbmhebF77A4
	9PFaT1JB9FtKli3KJC1tUFARSnPTAY6jX4I8oRMpMjfwP7UWkxh57D4hi7lSCCBs
	dnF+fckq8Xxxq32v+RqKXtCYaJsFUSgmdURp16aFUAJPhosXmMvlfFNMdwyi/yFK
	kt6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688043826; x=1688051026; bh=UUHaYOR2mXOlo
	OMHF3WLMCOR1A2U5vkl9suJPqtiWo0=; b=hdP5WXhT7ekq4Hva1FpIeceGlZkjX
	PM41q+KTShehkEBcGvudvdIPePUv8Ic7Blw/ll4QeTRT7pV0R3bfB2XESZW/QMiK
	EdzLZilFODp/dnZvF9ehS6UPa5oI6e/qG3Cp9rBWySjwoX9uOe6Y6dLz4yTggGfH
	1R0RHfJxaZNzPhyj1zvd/YVqF6hC4wqyXax2f8uUxqg7NK92S5j4d+Pcrg07JofZ
	2U7YagxrLOV+A4i6wAVi6OtOrsKvUjjSmcqql82rqAup6A4/4JvLg4aixq1XeHJr
	X25DD68SpkISgTOGRrlgDcff8lBJNoYNXerguGZWUGBmEgrt1YSYc+dgg==
X-ME-Sender: <xms:LYGdZPbTHyS9nO68McZSX4ifYtCRoImfg0CAouHb3-R9KlIdgCWQTQ>
    <xme:LYGdZOZfuvwlsk0z3FKArkaWzi11Tkq5r4bjLbo8j9_HXpdCqoDedEHdBvaeaFXcn
    1w7U1Uml2fcqYggtns>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:LYGdZB_R6-DNkmg56Smo41Uc6XJZcUp3KkYWTCjLLHirfqtMhVVFRA>
    <xmx:LYGdZFpQwZFsAMJ5qgl81x1LRvg1HpANW5hBEkBoRvkeG6Pfc9sH5g>
    <xmx:LYGdZKrWuxiIMQBpLaBPg_ks6YpbKnh8tYaEJVqzWayfhbnKIKNn4Q>
    <xmx:MoGdZGw85gJ0HbfxhNLQcRUxJH5nUOqtb4iVQlw3b4lOZ4Y2Daw5nmDtYA4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 688DEB60086; Thu, 29 Jun 2023 09:03:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Message-Id: <b31f42c1-4283-4793-b448-f7b9326be5d4@app.fastmail.com>
In-Reply-To: <20230629121952.10559-7-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <20230629121952.10559-7-tzimmermann@suse.de>
Date: Thu, 29 Jun 2023 15:03:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>,
 "Daniel Vetter" <daniel@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>, "Kees Cook" <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Juerg Haefliger" <juerg.haefliger@canonical.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Sebastian Reichel" <sebastian.reichel@collabora.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 06/12] arch: Declare screen_info in <asm/screen_info.h>
Content-Type: text/plain

On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:

> diff --git a/include/asm-generic/screen_info.h 
> b/include/asm-generic/screen_info.h
> new file mode 100644
> index 0000000000000..6fd0e50fabfcd
> --- /dev/null
> +++ b/include/asm-generic/screen_info.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_GENERIC_SCREEN_INFO_H
> +#define _ASM_GENERIC_SCREEN_INFO_H
> +
> +#include <uapi/linux/screen_info.h>
> +
> +#if defined(CONFIG_ARCH_HAS_SCREEN_INFO)
> +extern struct screen_info screen_info;
> +#endif
> +
> +#endif /* _ASM_GENERIC_SCREEN_INFO_H */
> diff --git a/include/linux/screen_info.h b/include/linux/screen_info.h
> index eab7081392d50..c764b9a51c24b 100644
> --- a/include/linux/screen_info.h
> +++ b/include/linux/screen_info.h
> @@ -4,6 +4,6 @@
> 
>  #include <uapi/linux/screen_info.h>
> 
> -extern struct screen_info screen_info;
> +#include <asm/screen_info.h>
> 

What is the purpose of adding a file in asm-generic? If all
architectures use the same generic file, I'd just leave the
declaration in include/linux/. I wouldn't bother adding the
#ifdef either, but I can see how that helps turn a link
error into an earlier compile error.

      Arnd
