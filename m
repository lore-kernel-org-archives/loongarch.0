Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A481946A
	for <loongarch@lists.linux.dev>; Tue, 17 Oct 2023 12:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="LnJgpiNW"
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Tue, 17 Oct 2023 13:57:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1697543873; bh=osOPrqiiKOprJxC70XFTAVq992xL7ZaM2aZVaEQG2Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnJgpiNWAMGVc0xEWtD9K4S88LSSPMbgijDz2pOHmBktW2Orxe1PlrhnLTDsBrgGX
	 tfFz/35yEpjsd2lWXJB3L8dxOM1f2ywcRKM8oZxaKD9ofLnmAeJI+8zMVH6ERwT4HW
	 LewlwUwa8Y743N4nthnjDBYgG1826/sWxFei++6o=
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 1002280683;
	Tue, 17 Oct 2023 13:57:54 +0200 (CEST)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 0841B1819FD; Tue, 17 Oct 2023 13:57:54 +0200 (CEST)
Date: Tue, 17 Oct 2023 13:57:54 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org, Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH v2 2/2] kbuild: unify no-compiler-targets and
 no-sync-config-targets
Message-ID: <ZS52wrL9meW8iehZ@buildd.core.avm.de>
Mail-Followup-To: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
References: <20231014105436.2119702-1-masahiroy@kernel.org>
 <20231014105436.2119702-2-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231014105436.2119702-2-masahiroy@kernel.org>
X-purgate-ID: 149429::1697543872-187BED95-BE924DB1/0/0
X-purgate-type: clean
X-purgate-size: 416
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Sat, Oct 14, 2023 at 07:54:36PM +0900, Masahiro Yamada wrote:
> Now that vdso_install does not depend on any in-tree build artifact,
> it no longer needs a compiler, making no-compiler-targets the same
> as no-sync-config-targets.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
> Changes in v2:
>   - Revive need-compiler flag
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
