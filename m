Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B218DB3D
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745202453; cv=none; b=FLgx2U61Qw7U5okcVHSAfeyE//76djiRViBgRwq3FN5YBOiyQr+EH3dvozVARV2GNl3kXU+8mWZ6vb8pPLbkJTUBhbGENIHhkww9r4UNNuK3Q/JxbJuw6SrHAJCs6Vxv2mYjheeC7Y26el1dcxSka6h5ZYQM0DcLwpEhTCQ3e6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745202453; c=relaxed/simple;
	bh=NrNC4IJl9Ke8dPV1S35kFEDK+tghxOLjqSRbsc4BXCg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ESltM5dHXIp4aklOAmKQWvsZrigi2Xd/SX4Y/DDcAydtWPsbXXd2iEROsAxyUUEPYXhYbmXU7pOcx74EcWmOSqPkcvN3iYhakX/XDh8o+9gMnnkI/o6EMaFSdgstdOqeeRxYmmQFmhOS8hH926/3/Yh1OTnyDZc/YR8U+stmSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=Wh8GBI7G; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="Wh8GBI7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1745202443;
	bh=plNE1fq2Q8qJWBIt/72HFbCl29tQ3CZgFJkjrMKBEmY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Wh8GBI7GMKsTbcPom3IpAxkhb/CvwVj1vJgydtGOTTLcb5ITDY2d7sLvxQ3wObmm9
	 37AjstE/92V+0ik1ub/M54WSYDGhZFJYRWzocq8r2GEG6bpMdHLwhOoEoplafPNRZV
	 l6C5J2M6joWL/j2scuy56MxdgvdTmoLdUGJQsOz4=
Received: from [192.168.124.30] (unknown [113.200.174.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A038F65A96;
	Sun, 20 Apr 2025 22:27:22 -0400 (EDT)
Message-ID: <a61ccfc40e80a6b418328718a9d40d28792ef2fa.camel@xry111.site>
Subject: Re: [PATCH 2/3] LoongArch/build: Add fallback install.sh
From: Xi Ruoyao <xry111@xry111.site>
To: Youling Tang <youling.tang@linux.dev>, Huacai Chen
 <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Youling Tang <tangyouling@kylinos.cn>
Date: Mon, 21 Apr 2025 10:27:19 +0800
In-Reply-To: <20250421020301.34185-2-youling.tang@linux.dev>
References: <20250421020301.34185-1-youling.tang@linux.dev>
	 <20250421020301.34185-2-youling.tang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2025-04-21 at 10:03 +0800, Youling Tang wrote:
> From: Youling Tang <tangyouling@kylinos.cn>
>=20
> As specified in scripts/install.sh, the priority order is
> as follows (from highest to lowest):
> =C2=A0 ~/bin/installkernel
> =C2=A0 /sbin/installkernel
> =C2=A0 arch/loongarch/boot/install.sh
>=20
> Fallback to default install.sh if installkernel not found.
>=20
> Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
> ---
> =C2=A0arch/loongarch/boot/install.sh | 44
> ++++++++++++++++++++++++++++++++++
> =C2=A01 file changed, 44 insertions(+)
> =C2=A0create mode 100755 arch/loongarch/boot/install.sh
>=20
> diff --git a/arch/loongarch/boot/install.sh
> b/arch/loongarch/boot/install.sh
> new file mode 100755
> index 000000000000..c97f611ca913
> --- /dev/null
> +++ b/arch/loongarch/boot/install.sh
> @@ -0,0 +1,44 @@
> +#!/bin/sh
> +#
> +# This file is subject to the terms and conditions of the GNU General
> Public
> +# License.=C2=A0 See the file "COPYING" in the main directory of this
> archive
> +# for more details.
> +#
> +# Copyright (C) 1995 by Linus Torvalds
> +#
> +# Adapted from code in arch/i386/boot/Makefile by H. Peter Anvin
> +# Adapted from code in arch/i386/boot/install.sh by Russell King
> +#
> +# "make install" script for the RISC-V Linux port
                                   ^^^^^^

Pasto here.

> +#
> +# Arguments:
> +#=C2=A0=C2=A0 $1 - kernel version
> +#=C2=A0=C2=A0 $2 - kernel image file
> +#=C2=A0=C2=A0 $3 - kernel map file
> +#=C2=A0=C2=A0 $4 - default install path (blank if root directory)
> +
> +set -e
> +
> +case "${2##*/}" in
> +# Compressed install
> +vmlinuz.efi)
> +=C2=A0 echo "Installing compressed kernel"
> +=C2=A0 base=3Dvmlinuz
> +=C2=A0 ;;
> +# Normal install
> +*)
> +=C2=A0 echo "Installing normal kernel"
> +=C2=A0 base=3Dvmlinux
> +=C2=A0 ;;
> +esac
> +
> +if [ -f $4/$base-$1 ]; then
> +=C2=A0 mv $4/$base-$1 $4/$base-$1.old
> +fi
> +cat $2 > $4/$base-$1
> +
> +# Install system map file
> +if [ -f $4/System.map-$1 ]; then
> +=C2=A0 mv $4/System.map-$1 $4/System.map-$1.old
> +fi
> +cp $3 $4/System.map-$1

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University
