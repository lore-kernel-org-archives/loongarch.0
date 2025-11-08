Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D18425A630
	for <loongarch@lists.linux.dev>; Sat,  8 Nov 2025 10:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762596536; cv=none; b=JqFOX4Oy/MisPzgaT3Bdtc9Lj7n14uDAhYSrF4f9kwh/pWRYrA8xq2DI2gurFud5N0IZFiDubtYAE69A8mdw/z9LaWKtUbTMCoI939kbqW0n9K1R0iNF02zy1MiVAfAVSgaJvA/4HFmzgWOlyja2oNsIQOydvujTzwE7YiewXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762596536; c=relaxed/simple;
	bh=lwrdlSMDo6I4dhMwHxhXV+07A+bfnpnTprdZw5wGY0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ova4qXB0NqVSIi8shRWkB4Nm+6kgN4g8m6DmOniZob3PfP6ITxp/pghsCCuOe/QlVxFcSgVg5zdg1Onn4qz96K/ldpMwxjVO9T1McfHM3ZLlYdRHppo3HRl/oIDhFcoZtadYa+6oh6+q4kdYz042LH8tQeBfQkEAjbONFcxg2cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TU68NA/W; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TU68NA/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1762596526;
	bh=lwrdlSMDo6I4dhMwHxhXV+07A+bfnpnTprdZw5wGY0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TU68NA/W87GcyBA43glIu4XLeA1Qce9mDMNUhhOQ8g+SG/CsOXqR+OKuT1oV9TkZl
	 eSwlZte2+cl6ZFBSwT4g2Raf9G7ySXxGDr43OjI4L4RynMyfu/9LXqc/PH+y0L/hcx
	 VcINbGcyRlfrmgk0eupQM1U0znTWL2dU2GD6y4fQ=
Date: Sat, 8 Nov 2025 11:08:46 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: ptrace: Use UAPI types in UAPI header
Message-ID: <952efc87-2e1a-45b3-9ccb-e7f5120aba0d@t-8ch.de>
References: <20251029-loongarch-uapi-ptrace-types-v1-1-5c84855a348d@weissschuh.net>
 <CAAhV-H4oDtOUB_CecFE2sPE-JSQNNWvFRmY8=ZdDOCdD8kdo7g@mail.gmail.com>
 <4f8402e5-2bfa-4ee3-9123-fac887ed866d@t-8ch.de>
 <CAAhV-H4c8_GdnCdHfX_bVQ+rrGRtNua1r2MR0n5rXgXfgte0Sw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H4c8_GdnCdHfX_bVQ+rrGRtNua1r2MR0n5rXgXfgte0Sw@mail.gmail.com>

On 2025-11-03 17:38:49+0800, Huacai Chen wrote:
> On Mon, Nov 3, 2025 at 5:27 PM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > On 2025-11-03 17:12:58+0800, Huacai Chen wrote:
> > > On Wed, Oct 29, 2025 at 11:20 PM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > >
> > > > The kernel UAPI headers already contain fixed-width integer types,
> > > > there is no need to rely on libc types. There may not be a libc
> > > > available or it may not provide <stdint.h>, like for example on nolibc.
> > > >
> > > > This also aligns the header with the rest of the LoongArch UAPI headers.
> >
> > > Thank you for your patch, but could you please tell me some history
> > > and user guide about the three styles: u64, __u64 and unint64_t?
> >
> > uint64_t -> userspace type, should not be used within the kernel
> >             can technically be used in UAPI it will be somewhat
> >             nonstandard and introduce a dependency on libc with no
> >             upsides.
> But a simple grep shows there are many uses of uint64_t in the kernel
> code, are they all wrong?

Yes, they are wrong. See also the explanation from Arnd.

> > u64      -> kernel-internal type, used for regular kernel code
> >             defined in include/linux/types.h
> >
> > __u64    -> UAPI type usable from both kernel and userspace code
> >             defined in include/uapi/linux/types.
> >
> > As a note: When applying the patch I want to clarify the commit message
> > a bit, as nolibc indeed has a stdint.h header. The real breakage comes
> > from a validation step we perform which does not add the libc include
> > directory to the include path.
