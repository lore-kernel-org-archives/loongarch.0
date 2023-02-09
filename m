Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB4B627
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:35:57 +0000 (UTC)
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3193ZbDm007908;
	Thu, 9 Feb 2023 04:35:37 +0100
Date: Thu, 9 Feb 2023 04:35:37 +0100
From: Willy Tarreau <w@1wt.eu>
To: chris.chenfeiyang@gmail.com
Cc: paulmck@kernel.org, Feiyang Chen <chenfeiyang@loongson.cn>, arnd@arndb.de,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add LoongArch support to nolibc
Message-ID: <Y+RqCcaS6pJ+W9+N@1wt.eu>
References: <cover.1675907639.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1675907639.git.chenfeiyang@loongson.cn>

Hi Feiyang,

On Thu, Feb 09, 2023 at 11:24:11AM +0800, chris.chenfeiyang@gmail.com wrote:
> From: Feiyang Chen <chenfeiyang@loongson.cn>
> 
> Add statx() and make stat() rely on statx() if necessary.
> Add support for LoongArch (32 and 64 bit) to nolibc.
> It was tested on LoongArch64 only.
> 
> The latest QEMU support full-system emulation of a LoongArch64
> machine, but for the moment we need to specify the firmware manually.
> https://github.com/loongson/Firmware/tree/main/LoongArchVirtMachine
> 
> QEMU_ARGS_loongarch  = -M virt -bios edk2-loongarch64-code.fd ...
> 
> v2:
> - Mention that statx() will also benefit other architectures.
> - Make stat() rely on statx() when available.
> - Put the whitespace changes into one commit.
> 
> v3:
> - Add #if defined(__NR_statx) guard.
> - Keep the check for statx() from the first version.
> - Mention that we may use statx() everywhere in the future.
> - struct statx stat -> struct statx statx.

I'm personally fine with this one. I'll give it a try with all supported
archs to make sure we don't have any unexpected side effect, and unless
anyone has any other comment, we'll queue this series.

Thank you!
Willy
