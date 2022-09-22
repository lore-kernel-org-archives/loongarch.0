Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71A23229
	for <loongarch@lists.linux.dev>; Thu, 22 Sep 2022 12:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663849395; x=1695385395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=anV/mtQTR0ZoFA6AaZoQH1kppXPIdPVrz2EF7CF8qj0=;
  b=Eub8D3povQk+h/drkOcKm2EweMQv+jsnxJYUyiJi5xaFO/MfKxgy/h6x
   UMlc8hpw8EXuQ0o3erS45QeKOxBNPsxVyNRf8DTPcAI0RILj6f+wEIZBj
   GlgRUKKjgT280Jsgb0sMmXAdaswKS2ko+RaZVRcZ9fwr5vhBdLGiJ8UTW
   BN7skzhPoq2IUCLg/h+UTCpnRiDVrVQC+fXLNwJHN21lSJqHIlWEYeb4V
   pthipCH61jVcU1pRb9YkDooCWlldEMFuaNLMY4jSJsa/0gKjBCqu4DGx2
   qbz1S2G4nzn1cuA4G1G82N7PLzSlmzDvqOSI6J1mCECrE4dZAmget0uzV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280650422"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="280650422"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 05:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="948572563"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2022 05:23:12 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 41F22238; Thu, 22 Sep 2022 15:23:30 +0300 (EEST)
Date: Thu, 22 Sep 2022 15:23:30 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Wolfram Sang <wsa@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
	Jianmin Lv <lvjianmin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
Message-ID: <YyxTwl7mos/hARWm@black.fi.intel.com>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>

Hi,

On Thu, Sep 22, 2022 at 07:39:54PM +0800, Binbin Zhou wrote:
> Under LoongARCH based on ACPI(such as Loongson-3A + LS7A), the ls2x i2c
> driver obtains the i2c bus number from ACPI table.

Why this is needed? The I2CSerialBusV2() resource should be enough to
identify the adapter, and I don't see why static number would be needed
for anything?
